# SquidCoolify

Squid forward caching proxy with HTTPS caching (SSL bump) and [SquidStats](https://github.com/kaelthasmanu/SquidStats) dashboard, designed to run as a Docker Compose resource in Coolify.

## Setup in Coolify

1. Add this repo as a **Docker Compose** resource in Coolify
2. Configure these environment variables in the Coolify service settings:

### Squid service environment variables

| Variable | Description | Default |
|---|---|---|
| `ALLOWED_IPS` | Comma-separated IPs/CIDRs allowed to use the proxy | *(empty = RFC1918 networks)* |
| `SQUID_PORT` | External port for Squid | `3128` |

**Example `ALLOWED_IPS`:** `192.168.1.10,10.0.0.0/24,172.16.0.5`

### SquidStats service environment variables

| Variable | Description | Default |
|---|---|---|
| `SQUIDSTATS_PASSWORD` | Initial admin password | `admin` |
| `SQUIDSTATS_SECRET_KEY` | Flask secret key | `changeme` |
| `TZ` | Timezone | `Europe/Amsterdam` |

## Architecture

- **squid** - Forward caching proxy with SSL bump for HTTPS caching. Port `3128`.
- **squid-stats** - Web dashboard on port `5000` with Traefik/Authentik middleware label for SSO.

## HTTPS Caching

Squid generates a self-signed CA certificate on first start for SSL bumping. Clients need to trust this CA or ignore certificate warnings. The CA cert is stored in the `squid-ssl` volume.

## Client configuration

Configure your client to use the proxy:

```
export http_proxy=http://<coolify-host>:3128
export https_proxy=http://<coolify-host>:3128
```
