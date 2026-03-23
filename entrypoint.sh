#!/bin/sh
set -e

SSL_DB_DIR="/var/lib/squid/ssl_db"
CERT_DIR="/etc/squid/certs"
CONF="/etc/squid/squid.conf"
CERTGEN="/usr/lib/squid/security_file_certgen"

# Generate self-signed CA certificate for SSL bumping
mkdir -p "$CERT_DIR"
if [ ! -f "$CERT_DIR/squid-ca.pem" ]; then
    echo "Generating Squid CA certificate for HTTPS caching..."
    openssl req -new -newkey rsa:2048 -sha256 -days 3650 -nodes \
        -x509 -extensions v3_ca \
        -keyout "$CERT_DIR/squid-ca.pem" \
        -out "$CERT_DIR/squid-ca.pem" \
        -subj "/CN=Squid Proxy CA/O=SquidCoolify/C=NL"
fi

# Initialize SSL certificate database
if [ ! -d "$SSL_DB_DIR/certs" ]; then
    echo "Initializing SSL certificate database..."
    "$CERTGEN" -c -s "$SSL_DB_DIR" -M 64MB
fi
chown -R squid:squid "$SSL_DB_DIR"

# Build ACL from ALLOWED_IPS environment variable
# ALLOWED_IPS can be: single IP, comma-separated IPs, or CIDR notation
# Example: ALLOWED_IPS=192.168.1.10,10.0.0.0/24,172.16.0.5
ACL_FILE="/etc/squid/allowed_ips.conf"
: > "$ACL_FILE"
if [ -n "$ALLOWED_IPS" ]; then
    echo "$ALLOWED_IPS" | tr ',' '\n' | while read -r ip; do
        ip=$(echo "$ip" | xargs)
        [ -n "$ip" ] && echo "acl allowed_clients src ${ip}" >> "$ACL_FILE"
    done
fi

# Write squid.conf
cat > "$CONF" <<EOF
# === Ports ===
http_port 3128 ssl-bump \
    cert=${CERT_DIR}/squid-ca.pem \
    generate-host-certificates=on \
    dynamic_cert_mem_cache_size=16MB

# === SSL Bump (HTTPS caching) ===
sslcrtd_program ${CERTGEN} -s ${SSL_DB_DIR} -M 64MB
sslcrtd_children 5
ssl_bump bump all
sslproxy_cert_error allow all

# === ACL definitions ===
acl localnet src 10.0.0.0/8
acl localnet src 172.16.0.0/12
acl localnet src 192.168.0.0/16
acl SSL_ports port 443
acl Safe_ports port 80
acl Safe_ports port 443
acl Safe_ports port 1025-65535
acl CONNECT method CONNECT

include ${ACL_FILE}

# === Access rules ===
http_access deny !Safe_ports
http_access deny CONNECT !SSL_ports
EOF

# If ALLOWED_IPS is set, only allow those IPs; otherwise allow RFC1918
if [ -n "$ALLOWED_IPS" ]; then
    cat >> "$CONF" <<EOF
http_access allow allowed_clients
http_access deny all
EOF
else
    cat >> "$CONF" <<EOF
http_access allow localnet
http_access allow localhost
http_access deny all
EOF
fi

cat >> "$CONF" <<'EOF'

# === Caching ===
cache_mem 512 MB
maximum_object_size_in_memory 10 MB
maximum_object_size 1 GB
cache_dir ufs /var/spool/squid 10000 16 256
cache_replacement_policy heap LFUDA
memory_replacement_policy heap GDSF

# === Logging ===
access_log daemon:/var/log/squid/access.log squid
cache_log /var/log/squid/cache.log
cache_store_log /var/log/squid/store.log
logfile_rotate 7

# === Performance ===
dns_nameservers 1.1.1.1 8.8.8.8
shutdown_lifetime 5 seconds
forwarded_for delete
via off

# === Refresh patterns ===
refresh_pattern -i \.(gif|png|jpg|jpeg|ico|webp|svg)$ 43200 90% 86400
refresh_pattern -i \.(css|js|woff|woff2|ttf|eot)$ 43200 90% 86400
refresh_pattern -i \.(deb|rpm|pkg|tar\.gz|zip)$ 129600 100% 259200
refresh_pattern . 0 20% 4320

# Run as squid user
cache_effective_user squid
cache_effective_group squid
EOF

echo "=== Squid configuration ==="
cat "$CONF"
echo "=========================="

# Create log & cache directories with correct permissions
mkdir -p /var/log/squid /var/spool/squid
chown -R squid:squid /var/log/squid /var/spool/squid

# Create cache directories
squid -z -N 2>/dev/null || true

echo "Starting Squid..."
exec squid -NYC
