#!/bin/sh
set -e
cd /app

# ============================================================
# Python route files
# ============================================================

# --- routes/auth_routes.py ---
sed -i \
  -e 's/Demasiados intentos fallidos\. Intenta de nuevo en/Too many failed attempts. Try again in/g' \
  -e 's/minutos\./minutes./g' \
  -e 's/Por favor, ingresa usuario y contraseña\./Please enter username and password./g' \
  -e 's/con sesión extendida/with extended session/g' \
  -e 's/sesión estándar/standard session/g' \
  -e 's/¡Bienvenido,/Welcome,/g' \
  -e 's/Usuario o contraseña incorrectos\./Incorrect username or password./g' \
  -e 's/Has cerrado sesión correctamente\./You have successfully logged out./g' \
  routes/auth_routes.py

# --- routes/admin_routes.py ---
sed -i \
  -e 's/Variables de entorno guardadas exitosamente/Environment variables saved successfully/g' \
  -e 's/Host de Pi-hole no proporcionado/Pi-hole host not provided/g' \
  -e 's/Sincronización de listas iniciada (en segundo plano)/List synchronization started (in background)/g' \
  -e 's/Archivo importado correctamente/File imported successfully/g' \
  -e 's/Error importando archivo de blacklist/Error importing blacklist file/g' \
  -e 's/Error al procesar el archivo/Error processing the file/g' \
  -e 's/Lista importada desde URL correctamente/List imported from URL successfully/g' \
  -e 's/Error importando desde URL/Error importing from URL/g' \
  -e 's/No se encontraron dominios para importar/No domains found to import/g' \
  -e 's/Blacklist actualizada exitosamente/Blacklist updated successfully/g' \
  -e 's/Error guardando BLACKLIST_DOMAINS/Error saving BLACKLIST_DOMAINS/g' \
  -e 's/Error al guardar blacklist/Error saving blacklist/g' \
  -e 's/Lista personalizada vacía/Custom list is empty/g' \
  -e 's/Error guardando lista personalizada/Error saving custom list/g' \
  -e 's/Error al guardar la lista/Error saving the list/g' \
  -e 's/Lista personalizada guardada en BLACKLIST_DOMAINS/Custom list saved to BLACKLIST_DOMAINS/g' \
  -e 's/Índice de regla inválido/Invalid rule index/g' \
  -e 's/Nombre de tabla no proporcionado/Table name not provided/g' \
  -e 's/Nombre de tabla inválido/Invalid table name/g' \
  -e 's/No se puede eliminar estas tablas críticas/Cannot delete these critical tables/g' \
  -e 's/Error al cargar la vista de división de configuración/Error loading the split configuration view/g' \
  -e 's/Error al cargar la vista/Error loading the view/g' \
  -e 's/Error de validación de la configuración/Configuration validation error/g' \
  -e 's/URL no proporcionada/URL not provided/g' \
  -e 's/Lista eliminada/List deleted/g' \
  -e 's/URL de fuente inválida/Invalid source URL/g' \
  -e 's/Error consultando dominios para activar blocklist/Error querying domains to activate blocklist/g' \
  -e 's/Error al consultar dominios/Error querying domains/g' \
  -e 's/No hay dominios activos para/No active domains for/g' \
  -e 's/Error escribiendo archivo para/Error writing file for/g' \
  -e 's/Error guardando ACL en config modular/Error saving ACL in modular config/g' \
  -e 's/No se pudo leer la config modular/Could not read the modular config/g' \
  -e 's/Error agregando ACL para blocklist individual/Error adding ACL for individual blocklist/g' \
  -e 's/Error al agregar ACL/Error adding ACL/g' \
  -e 's/Formato de URL inválido/Invalid URL format/g' \
  -e 's/Blocklist no está activada/Blocklist is not activated/g' \
  -e 's/Error eliminando ACL de blocklist individual/Error removing ACL from individual blocklist/g' \
  -e 's/Error al eliminar ACL/Error removing ACL/g' \
  -e 's/Archivo no regular/Not a regular file/g' \
  -e 's/Error eliminando archivo/Error deleting file/g' \
  -e 's/JSON inválido/Invalid JSON/g' \
  -e 's/Error en toggle de blocklist/Error toggling blocklist/g' \
  -e 's/Error interno al cambiar estado de blocklist/Internal error changing blocklist state/g' \
  -e 's/ID de ACL invalido/Invalid ACL ID/g' \
  routes/admin_routes.py

# --- routes/stats_routes.py ---
sed -i \
  -e 's/Estadísticas del Sistema/System Statistics/g' \
  -e 's/Estadisticas del comportamiento del Sistema/System Behavior Statistics/g' \
  -e 's/devolvió un error/returned an error/g' \
  routes/stats_routes.py

# --- app.py ---
sed -i \
  -e 's/Filtro para formatear fechas en las plantillas/Filter to format dates in templates/g' \
  -e 's/Variables de entorno cargadas correctamente desde .env/Environment variables loaded successfully from .env/g' \
  app.py

# ============================================================
# Templates - Auth
# ============================================================

sed -i \
  -e 's/Panel de Administración/Administration Panel/g' \
  -e 's/Ingresa tu usuario/Enter your username/g' \
  -e 's/Ingresa tu contraseña/Enter your password/g' \
  -e 's/Recordarme/Remember me/g' \
  -e 's/Iniciar Sesión/Log In/g' \
  -e 's/Conexión segura con JWT/Secure connection with JWT/g' \
  -e 's/Volver al Dashboard Principal/Back to Main Dashboard/g' \
  -e 's/Verificando\.\.\./Verifying.../g' \
  templates/auth/login.html

# ============================================================
# Templates - Main dashboard (index.html)
# ============================================================

sed -i \
  -e 's/Intervalo de refresco (segundos)/Refresh interval (seconds)/g' \
  -e 's/Aplicar/Apply/g' \
  -e 's/Ver Resumen/View Summary/g' \
  -e 's/Ver Detalles/View Details/g' \
  -e 's/Respuesta no OK/Response not OK/g' \
  -e 's/Error al actualizar conexiones:/Error updating connections:/g' \
  -e 's/Guardado/Saved/g' \
  -e 's/No se pudo guardar/Could not save/g' \
  -e 's/Intervalo por defecto almacenado:/Default interval stored:/g' \
  templates/index.html

# ============================================================
# Templates - Admin
# ============================================================

# --- dashboardAdmin.html ---
sed -i \
  -e 's/Dashboard - Resumen del Sistema/Dashboard - System Overview/g' \
  -e 's/Total ACLs/Total ACLs/g' \
  -e 's/Reglas HTTP/HTTP Rules/g' \
  -e 's/No se encontraron configuraciones/No configurations found/g' \
  -e 's/No se han detectado ACLs, reglas HTTP ni delay pools en tu configuración de Squid\./No ACLs, HTTP rules, or delay pools detected in your Squid configuration./g' \
  -e 's/¿tu configuración ya está dividida en módulos?/Is your configuration already split into modules?/g' \
  -e 's/Si ya tienes tu configuración organizada en archivos separados.*SquidStats puede leerla directamente sin necesidad de unificarla\./If your configuration is already organized in separate files, SquidStats can read it directly without needing to unify it./g' \
  -e 's/Gestionar Configuración Modular/Manage Modular Configuration/g' \
  -e 's/Editar squid\.conf/Edit squid.conf/g' \
  -e 's/Acciones Rápidas/Quick Actions/g' \
  -e 's/Deshabilitado por errores de configuración/Disabled due to configuration errors/g' \
  -e 's/Editar Configuración/Edit Configuration/g' \
  -e 's/Modificar archivo squid\.conf (deshabilitado)/Modify squid.conf file (disabled)/g' \
  -e 's/Modificar archivo squid\.conf/Modify squid.conf file/g' \
  -e 's/Crear nueva regla de acceso (deshabilitado)/Create new access rule (disabled)/g' \
  -e 's/Crear nueva regla de acceso/Create new access rule/g' \
  -e 's/Agregar ACL/Add ACL/g' \
  -e 's/Ver Logs/View Logs/g' \
  -e 's/Revisar logs del sistema/Review system logs/g' \
  -e 's/Reiniciar Squid/Restart Squid/g' \
  -e 's/Reiniciar el servicio/Restart the service/g' \
  -e 's/Estado del Sistema/System Status/g' \
  -e 's/Servicio Squid/Squid Service/g' \
  -e 's/No cargada/Not loaded/g' \
  -e 's/Cargada/Loaded/g' \
  templates/admin/dashboardAdmin.html

# --- users.html ---
sed -i \
  -e 's/Gestión de Usuarios/User Management/g' \
  -e 's/Crear Usuario/Create User/g' \
  -e 's/Último Login/Last Login/g' \
  -e 's/Nunca/Never/g' \
  -e 's/Editar/Edit/g' \
  -e 's/Eliminar/Delete/g' \
  -e 's/¿Está seguro de que desea eliminar el usuario/Are you sure you want to delete user/g' \
  -e 's/Esta acción no se puede deshacer\./This action cannot be undone./g' \
  templates/admin/users.html

# --- config.html ---
sed -i \
  -e 's/Configuración General/General Configuration/g' \
  -e 's/Configuración de Squid/Squid Configuration/g' \
  -e 's/Configuración de Base de Datos/Database Configuration/g' \
  -e 's/Configuración de Seguridad/Security Configuration/g' \
  -e 's/Configuración de Proxy/Proxy Configuration/g' \
  -e 's/Configuración de Telegram/Telegram Configuration/g' \
  -e 's/Lista Negra de Dominios/Domain Blacklist/g' \
  -e 's/Base de Datos/Database/g' \
  -e 's/Seguridad/Security/g' \
  -e 's/Lista Negra/Blacklist/g' \
  -e 's/Esta variable está protegida y no puede ser modificada desde aquí/This variable is protected and cannot be modified from here/g' \
  -e 's/Guardar Cambios/Save Changes/g' \
  templates/admin/config.html

# --- blacklist.html ---
sed -i \
  -e 's/Blacklist - Gestor de Listas/Blacklist - List Manager/g' \
  -e 's/Personalizada/Custom/g' \
  -e 's/Importar listas/Import lists/g' \
  -e 's/Importar/Import/g' \
  -e 's/Integración Pi-hole/Pi-hole Integration/g' \
  -e 's/Funcionalidad en Beta/Beta Feature/g' \
  -e 's/Conecta y sincroniza listas bloqueadas desde un servidor Pi-hole\. Aquí puedes configurar conexión y ver el estado\./Connect and sync blocked lists from a Pi-hole server. Configure the connection and view the status here./g' \
  -e 's/Probar Conexión/Test Connection/g' \
  -e 's/Sincronizar Listas/Sync Lists/g' \
  -e 's/Integración AdGuard/AdGuard Integration/g' \
  -e 's/Soporte para fuentes y listas públicas compatibles con AdGuard\./Support for AdGuard-compatible public sources and lists./g' \
  -e 's/URL de la lista/List URL/g' \
  -e 's/Agregar Lista/Add List/g' \
  -e 's/Listas importadas/Imported lists/g' \
  -e 's/dominios/domains/g' \
  -e 's/Activa en Squid/Active in Squid/g' \
  -e 's/Inactiva/Inactive/g' \
  -e 's/Desactivar bloqueo en Squid/Deactivate blocking in Squid/g' \
  -e 's/Activar bloqueo en Squid/Activate blocking in Squid/g' \
  -e 's/Eliminar lista y dominios/Delete list and domains/g' \
  -e 's/Error al cambiar estado/Error changing state/g' \
  -e 's/Error de conexión al servidor/Server connection error/g' \
  -e 's/¿Estás seguro de que deseas eliminar la siguiente lista?/Are you sure you want to delete the following list?/g' \
  -e 's/Esta acción es irreversible y eliminará todos los dominios asociados\./This action is irreversible and will delete all associated domains./g' \
  -e 's/La lista ya existe en el sistema\. No puedes agregar la misma URL dos veces\./The list already exists. You cannot add the same URL twice./g' \
  -e 's/Importando lista desde URL/Importing list from URL/g' \
  -e 's/Validando enlace y procesando dominios\.\.\./Validating link and processing domains.../g' \
  -e 's/Importando archivo de listas/Importing list file/g' \
  -e 's/Leyendo archivo y aplicando reglas de bloqueo\.\.\./Reading file and applying blocking rules.../g' \
  -e 's/Exportar archivo hosts/Export hosts file/g' \
  -e 's/Lista Personalizada/Custom List/g' \
  -e 's/Añade dominios manualmente o pega una lista separada por comas\/lineas\./Add domains manually or paste a comma\/line-separated list./g' \
  -e 's/Importa desde archivos locales o pega URLs de listas públicas\./Import from local files or paste public list URLs./g' \
  -e 's/Subir archivo/Upload file/g' \
  -e 's/Exporta o importa reglas en formato compatible con dnsmasq\./Export or import rules in dnsmasq-compatible format./g' \
  -e 's/Guardar/Save/g' \
  -e 's/Cancelar/Cancel/g' \
  templates/admin/blacklist.html

# --- acls.html ---
sed -i \
  -e 's/Gestión de ACLs/ACL Management/g' \
  -e 's/Agregar Nueva ACL/Add New ACL/g' \
  -e 's/Agregar ACL/Add ACL/g' \
  -e 's/src (IP origen)/src (Source IP)/g' \
  -e 's/dst (IP destino)/dst (Destination IP)/g' \
  -e 's/dstdomain (Dominio destino)/dstdomain (Destination domain)/g' \
  -e 's/port (Puerto)/port (Port)/g' \
  -e 's/time (Tiempo)/time (Time)/g' \
  -e 's/method (Método HTTP)/method (HTTP Method)/g' \
  -e 's/proxy_auth (Autenticación)/proxy_auth (Authentication)/g' \
  -e 's/maxconn (Conexiones máximas)/maxconn (Maximum connections)/g' \
  -e 's/Nombre:/Name:/g' \
  -e 's/Tipo:/Type:/g' \
  -e 's/Valor:/Value:/g' \
  -e 's/Guardar ACL/Save ACL/g' \
  -e 's/Editar ACL/Edit ACL/g' \
  -e 's/Actualizar ACL/Update ACL/g' \
  -e 's/Acciones/Actions/g' \
  -e 's/No hay ACLs configuradas/No ACLs configured/g' \
  -e 's/Las ACLs son fundamentales para controlar el acceso en Squid/ACLs are essential for controlling access in Squid/g' \
  -e 's/¿Ya tienes ACLs configuradas?/Do you already have ACLs configured?/g' \
  -e 's/Si tu squid\.conf aún no está dividido.*gestión modular\./If your squid.conf is not yet split, you can split your configuration for better modular management./g' \
  -e 's/Si ya está dividido.*desde Configuración\./If already split, verify the files are in the correct directory or edit them directly from Configuration./g' \
  -e 's/Crear primera ACL/Create first ACL/g' \
  -e 's/¿Estás seguro de que quieres eliminar la ACL/Are you sure you want to delete the ACL/g' \
  -e 's/Cancelar/Cancel/g' \
  templates/admin/acls.html

# --- acls_new.html ---
sed -i \
  -e 's/Gestión de Access Control Lists (ACLs)/Access Control Lists (ACLs) Management/g' \
  -e 's/Define condiciones para controlar el acceso al proxy/Define conditions to control proxy access/g' \
  -e 's/¡MUY IMPORTANTE!/VERY IMPORTANT!/g' \
  -e 's/Esta funcionalidad se encuentra en RC\. Puede contener errores y comportamientos inesperados\./This feature is in RC. It may contain errors and unexpected behavior./g' \
  -e 's/Por favor, no la uses en producción de momento\. Úsala únicamente en un entorno de prueba\./Please do not use it in production. Use it only in a test environment./g' \
  -e 's/Acerca de las ACLs:/About ACLs:/g' \
  -e 's/ACLs rápidas - no requieren lookups externos/Fast ACLs - no external lookups required/g' \
  -e 's/ACLs lentas - pueden requerir DNS o autenticación/Slow ACLs - may require DNS or authentication/g' \
  -e 's/Usa las ACLs en reglas de http_access, http_reply_access, etc\./Use ACLs in http_access, http_reply_access rules, etc./g' \
  -e 's/ACLs predefinidas:/Predefined ACLs:/g' \
  -e 's/Editar/Edit/g' \
  -e 's/Eliminar/Delete/g' \
  -e 's/No hay ACLs personalizadas configuradas/No custom ACLs configured/g' \
  -e 's/Las ACLs predefinidas de Squid siguen disponibles/Squid predefined ACLs are still available/g' \
  -e 's/Crear primera ACL/Create first ACL/g' \
  templates/admin/acls_new.html

# --- acls_modals.html ---
sed -i \
  -e 's/Agregar Nueva ACL/Add New ACL/g' \
  -e 's/Nombre de la ACL:/ACL Name:/g' \
  -e 's/mi_acl_personalizada/my_custom_acl/g' \
  -e 's/Solo letras, números, guiones y guiones bajos/Only letters, numbers, hyphens, and underscores/g' \
  -e 's/Tipo de ACL:/ACL Type:/g' \
  -e 's/Selecciona un tipo\.\.\./Select a type.../g' \
  -e 's/Red \/ IP/Network \/ IP/g' \
  -e 's/src - IP origen del cliente/src - Client source IP/g' \
  -e 's/dst - IP destino \[slow\]/dst - Destination IP [slow]/g' \
  -e 's/localip - IP local de conexión/localip - Local connection IP/g' \
  -e 's/Dominios/Domains/g' \
  -e 's/dstdomain - Dominio destino/dstdomain - Destination domain/g' \
  -e 's/srcdomain - Dominio origen \[slow\]/srcdomain - Source domain [slow]/g' \
  -e 's/dstdom_regex - Regex dominio destino/dstdom_regex - Destination domain regex/g' \
  -e 's/srcdom_regex - Regex dominio origen \[slow\]/srcdom_regex - Source domain regex [slow]/g' \
  -e 's/Puertos/Ports/g' \
  -e 's/port - Puerto TCP destino/port - Destination TCP port/g' \
  -e 's/localport - Puerto local/localport - Local port/g' \
  -e 's/myportname - Nombre de puerto/myportname - Port name/g' \
  -e 's/Tiempo/Time/g' \
  -e 's/time - Día y hora/time - Day and time/g' \
  -e 's/url_regex - Regex en URL completa/url_regex - Full URL regex/g' \
  -e 's/urlpath_regex - Regex en path/urlpath_regex - Path regex/g' \
  -e 's/urllogin - Regex en login URL/urllogin - Login URL regex/g' \
  -e 's/proto - Protocolo (HTTP\/FTP)/proto - Protocol (HTTP\/FTP)/g' \
  -e 's/method - Método HTTP/method - HTTP Method/g' \
  -e 's/http_status - Código HTTP/http_status - HTTP Code/g' \
  -e 's/Autenticación/Authentication/g' \
  -e 's/proxy_auth - Usuario proxy \[slow\]/proxy_auth - Proxy user [slow]/g' \
  -e 's/proxy_auth_regex - Regex usuario \[slow\]/proxy_auth_regex - User regex [slow]/g' \
  -e 's/ext_user - Usuario externo \[slow\]/ext_user - External user [slow]/g' \
  -e 's/ext_user_regex - Regex usuario ext \[slow\]/ext_user_regex - Ext user regex [slow]/g' \
  -e 's/Contenido/Content/g' \
  -e 's/Conexiones/Connections/g' \
  -e 's/maxconn - Max conexiones IP/maxconn - Max IP connections/g' \
  -e 's/max_user_ip - Max IPs usuario/max_user_ip - Max user IPs/g' \
  -e 's/Avanzado/Advanced/g' \
  -e 's/external - Helper externo \[slow\]/external - External helper [slow]/g' \
  -e 's/random - Probabilidad random/random - Random probability/g' \
  -e 's/note - Anotación transacción/note - Transaction annotation/g' \
  -e 's/any-of - Grupo OR/any-of - OR group/g' \
  -e 's/all-of - Grupo AND/all-of - AND group/g' \
  -e 's/Opciones (opcional):/Options (optional):/g' \
  -e 's/Valores:/Values:/g' \
  -e 's/Agregar valor/Add value/g' \
  -e 's/Comentario (opcional):/Comment (optional):/g' \
  -e 's/Descripción de esta ACL/Description of this ACL/g' \
  -e 's/Se agregará como comentario antes de la ACL/Will be added as a comment before the ACL/g' \
  -e 's/Cancelar/Cancel/g' \
  -e 's/Crear ACL/Create ACL/g' \
  -e 's/Editar ACL/Edit ACL/g' \
  -e 's/El tipo no se puede cambiar.*otro tipo/The type cannot be changed; create a new ACL if you need a different type/g' \
  -e 's/Opciones:/Options:/g' \
  -e 's/Comentario:/Comment:/g' \
  -e 's/Guardar Cambios/Save Changes/g' \
  templates/admin/acls_modals.html

# --- http_access.html ---
sed -i \
  -e 's/Reglas de Acceso HTTP/HTTP Access Rules/g' \
  -e 's/Las reglas se evalúan en orden\. La primera coincidencia determina el acceso\./Rules are evaluated in order. The first match determines access./g' \
  -e 's/Agregar Regla HTTP Access/Add HTTP Access Rule/g' \
  -e 's/Agregar Regla/Add Rule/g' \
  -e 's/¡MUY IMPORTANTE!/VERY IMPORTANT!/g' \
  -e 's/Esta funcionalidad se encuentra en RC\. Puede contener errores y comportamientos inesperados\./This feature is in RC. It may contain errors and unexpected behavior./g' \
  -e 's/Por favor, no la uses en producción de momento\. Úsala únicamente en un entorno de prueba\./Please do not use it in production. Use it only in a test environment./g' \
  -e 's/Importante sobre el orden:/Important about order:/g' \
  -e 's/Las reglas se procesan de arriba hacia abajo/Rules are processed from top to bottom/g' \
  -e 's/La primera regla que coincida se aplica (allow o deny)/The first matching rule is applied (allow or deny)/g' \
  -e 's/Si ninguna regla coincide.*última regla/If no rule matches, the opposite behavior of the last rule is applied/g' \
  -e 's/Se recomienda terminar con.*evitar confusión/It is recommended to end with "deny all" to avoid confusion/g' \
  -e 's/No hay reglas HTTP access configuradas/No HTTP access rules configured/g' \
  -e 's/Sin reglas, el acceso será DENEGADO por defecto/Without rules, access will be DENIED by default/g' \
  -e 's/¿Ya tienes reglas configuradas?/Do you already have rules configured?/g' \
  -e 's/Crear primera regla/Create first rule/g' \
  -e 's/Acción:/Action:/g' \
  -e 's/Permitir acceso/Allow access/g' \
  -e 's/Denegar acceso/Deny access/g' \
  -e 's/Agregar ACL/Add ACL/g' \
  -e 's/ACLs Comunes (opcional):/Common ACLs (optional):/g' \
  -e 's/Descripción (opcional):/Description (optional):/g' \
  -e 's/Ej: Permitir acceso desde la red local/E.g.: Allow access from local network/g' \
  -e 's/Se agregará como comentario antes de la regla/Will be added as a comment before the rule/g' \
  -e 's/Tip: Usa.*puerto seguro\./Tip: Use ! before an ACL name for negation. E.g.: !Safe_ports matches when it is NOT a safe port./g' \
  -e 's/Crear Regla/Create Rule/g' \
  -e 's/Editar Regla HTTP Access/Edit HTTP Access Rule/g' \
  -e 's/Guardar Cambios/Save Changes/g' \
  -e 's/Nombre de ACL (ej: localhost, !Safe_ports)/ACL name (e.g.: localhost, !Safe_ports)/g' \
  -e 's/Debe haber al menos una ACL en la regla/There must be at least one ACL in the rule/g' \
  -e 's/¿Estás seguro de que quieres eliminar la regla/Are you sure you want to delete the rule/g' \
  -e 's/Esto puede afectar el acceso al proxy\./This may affect proxy access./g' \
  -e 's/Cancelar/Cancel/g' \
  templates/admin/http_access.html

# --- delay_pools.html ---
sed -i \
  -e 's/Gestión de Delay Pools/Delay Pools Management/g' \
  -e 's/¡MUY IMPORTANTE!/VERY IMPORTANT!/g' \
  -e 's/¿Qué son los Delay Pools?/What are Delay Pools?/g' \
  -e 's/Clases disponibles:/Available classes:/g' \
  -e 's/Limitaciones importantes:/Important limitations:/g' \
  -e 's/Agregar Pool/Add Pool/g' \
  -e 's/Crear primer Pool/Create first Pool/g' \
  -e 's/Clase 1: Un solo bucket agregado para todos los clientes/Class 1: A single aggregate bucket for all clients/g' \
  -e 's/Clase 2: Bucket agregado + buckets individuales por host/Class 2: Aggregate bucket + individual buckets per host/g' \
  -e 's/Clase 3: Buckets por subred + buckets individuales por host/Class 3: Subnet buckets + individual buckets per host/g' \
  -e 's/Clase 4: Como clase 3 + buckets por usuario autenticado/Class 4: Like class 3 + buckets per authenticated user/g' \
  -e 's/Clase 5: Basado en tags de external_acl_type/Class 5: Based on external_acl_type tags/g' \
  -e 's/No limita overheads como TCP, ICP, DNS, etc\./Does not limit overheads like TCP, ICP, DNS, etc./g' \
  -e 's/Incompatible con slow aborts; usa quick abort bajo/Incompatible with slow aborts; use low quick abort/g' \
  -e 's/Una conexión puede tomar todo el ancho de banda de un bucket/A single connection can take all the bandwidth of a bucket/g' \
  -e 's/En Squid < 3\.1, buckets limitados a 32-bits/In Squid < 3.1, buckets limited to 32-bits/g' \
  -e 's/No hay delay pools configurados/No delay pools configured/g' \
  -e 's/¿Ya tienes delay pools configurados?/Do you already have delay pools configured?/g' \
  -e 's/Número de Pool:/Pool Number:/g' \
  -e 's/Clase de Pool:/Pool Class:/g' \
  -e 's/Parámetros de Velocidad:/Speed Parameters:/g' \
  -e 's/Reglas de Acceso (ACLs):/Access Rules (ACLs):/g' \
  -e 's/Agregar regla de acceso/Add access rule/g' \
  -e 's/Número único del pool (1-255)/Unique pool number (1-255)/g' \
  -e 's/Seleccione una clase\.\.\./Select a class.../g' \
  -e 's/Agregado/Aggregate/g' \
  -e 's/Individual (por host)/Individual (per host)/g' \
  -e 's/Por red/Per network/g' \
  -e 's/Formato: restore\/max (bytes por segundo)/Format: restore\/max (bytes per second)/g' \
  -e 's/Parámetros:/Parameters:/g' \
  -e 's/¿Estás seguro de que quieres eliminar/Are you sure you want to delete/g' \
  -e 's/Guardar Cambios/Save Changes/g' \
  -e 's/Cancelar/Cancel/g' \
  templates/admin/delay_pools.html

# --- edit_config.html ---
sed -i \
  -e 's/Editar Configuración de Squid/Edit Squid Configuration/g' \
  -e 's/Contenido del archivo squid\.conf:/squid.conf file contents:/g' \
  -e 's/Guardar Cambios/Save Changes/g' \
  -e 's/Cancelar/Cancel/g' \
  templates/admin/edit_config.html

# --- split_config.html ---
sed -i \
  -e 's/Dividir Configuración Squid/Split Squid Configuration/g' \
  -e 's/Modulariza tu archivo squid\.conf para una gestión más sencilla/Modularize your squid.conf file for easier management/g' \
  -e 's/Archivo de entrada/Input file/g' \
  -e 's/Directorio de salida/Output directory/g' \
  -e 's/archivos generados/files generated/g' \
  -e 's/No dividido aún/Not split yet/g' \
  -e 's/¿Qué hace esta funcionalidad?/What does this feature do?/g' \
  -e 's/Esta herramienta divide tu archivo monolítico squid\.conf en múltiples archivos modulares/This tool splits your monolithic squid.conf file into multiple modular files/g' \
  -e 's/Gestión y mantenimiento más sencillo de la configuración/Easier configuration management and maintenance/g' \
  -e 's/Mejor organización de directivas por funcionalidad/Better organization of directives by functionality/g' \
  -e 's/Facilita la edición desde la interfaz web/Facilitates editing from the web interface/g' \
  -e 's/Reduce errores al editar configuraciones complejas/Reduces errors when editing complex configurations/g' \
  -e 's/Archivos que se generarán/Files that will be generated/g' \
  -e 's/Acciones/Actions/g' \
  -e 's/Modo estricto/Strict mode/g' \
  -e 's/Abortar si se encuentran directivas desconocidas/Abort if unknown directives are found/g' \
  -e 's/Dividir Configuración/Split Configuration/g' \
  -e 's/Ver Archivos Generados/View Generated Files/g' \
  -e 's/Advertencia/Warning/g' \
  -e 's/Esta operación creará múltiples archivos en el directorio/This operation will create multiple files in the directory/g' \
  -e 's/Si ya existen archivos en ese directorio, serán sobrescritos\./If files already exist in that directory, they will be overwritten./g' \
  -e 's/Resultados/Results/g' \
  -e 's/Archivos Generados/Generated Files/g' \
  -e 's/Directorio:/Directory:/g' \
  -e 's/Cerrar/Close/g' \
  -e 's/¿Está seguro de que desea dividir la configuración de Squid?/Are you sure you want to split the Squid configuration?/g' \
  -e 's/Esta operación es reversible/This operation is reversible/g' \
  -e 's/Se creará automáticamente una copia de seguridad/A backup will be automatically created/g' \
  -e 's/Dividiendo configuración\.\.\./Splitting configuration.../g' \
  -e 's/Procesando/Processing/g' \
  -e 's/Configuración dividida exitosamente/Configuration split successfully/g' \
  -e 's/Se generaron/Generated/g' \
  -e 's/archivos en/files in/g' \
  -e 's/líneas/lines/g' \
  -e 's/No se encontraron archivos en el directorio/No files found in the directory/g' \
  -e 's/Se encontraron/Found/g' \
  -e 's/archivo(s) de configuración/configuration file(s)/g' \
  -e 's/Error al obtener los archivos/Error getting the files/g' \
  -e 's/Error de conexión al obtener los archivos/Connection error getting the files/g' \
  templates/admin/split_config.html

# --- user_form.html ---
sed -i \
  -e 's/Crear Usuario/Create User/g' \
  -e 's/Editar Usuario/Edit User/g' \
  -e 's/Complete el formulario para crear un nuevo usuario administrador\./Complete the form to create a new administrator user./g' \
  -e 's/Modifique los datos del usuario según sea necesario\./Modify the user data as needed./g' \
  -e 's/Nombre de Usuario/Username/g' \
  -e 's/Contraseña/Password/g' \
  -e 's/(dejar vacío para mantener la actual)/(leave empty to keep current)/g' \
  -e 's/La contraseña debe tener al menos 8 caracteres/Password must be at least 8 characters/g' \
  -e 's/Administrador/Administrator/g' \
  -e 's/Usuario activo/Active user/g' \
  -e 's/Cancelar/Cancel/g' \
  -e 's/Guardar Cambios/Save Changes/g' \
  templates/admin/user_form.html

# --- clean_data.html ---
sed -i \
  -e 's/Limpiar Datos - Administrador Squid Proxy/Clean Data - Squid Proxy Administrator/g' \
  -e 's/Limpiar Datos/Clean Data/g' \
  -e 's/Selecciona una tabla y elimina todos sus datos/Select a table and delete all its data/g' \
  -e 's/¡Advertencia!/Warning!/g' \
  -e 's/Esta acción es irreversible\. Una vez eliminados los datos, no se pueden recuperar\./This action is irreversible. Once data is deleted, it cannot be recovered./g' \
  -e 's/Eliminar Datos de Tabla/Delete Table Data/g' \
  -e 's/Seleccionar Tabla/Select Table/g' \
  -e 's/Cargando tablas\.\.\./Loading tables.../g' \
  -e 's/Información de la Tabla/Table Information/g' \
  -e 's/Información Importante/Important Information/g' \
  -e 's/Solo se eliminan los datos de la tabla, no la estructura/Only the table data is deleted, not the structure/g' \
  -e 's/Las tablas con sufijo de fecha.*son tablas diarias/Tables with a date suffix are daily tables/g' \
  -e 's/Algunas tablas son críticas para el funcionamiento del sistema/Some tables are critical for system operation/g' \
  -e 's/Se recomienda hacer un respaldo antes de eliminar datos importantes/It is recommended to back up before deleting important data/g' \
  -e 's/Error al cargar las tablas/Error loading the tables/g' \
  -e 's/Selecciona una tabla\.\.\./Select a table.../g' \
  -e 's/registros/records/g' \
  -e 's/Esta tabla está vacía/This table is empty/g' \
  -e 's/¿Está seguro de que desea eliminar TODOS los datos de la tabla/Are you sure you want to delete ALL data from the table/g' \
  -e 's/Se eliminarán/Will be deleted/g' \
  -e 's/Esta acción NO se puede deshacer\./This action CANNOT be undone./g' \
  -e 's/Eliminando datos\.\.\./Deleting data.../g' \
  -e 's/Error al eliminar los datos de la tabla/Error deleting the table data/g' \
  -e 's/Error al eliminar los datos/Error deleting the data/g' \
  templates/admin/clean_data.html

# --- base.html (admin) ---
sed -i \
  -e 's/Administrador Squid Proxy/Squid Proxy Administrator/g' \
  -e 's/Recargar/Reload/g' \
  -e 's/Reiniciar/Restart/g' \
  -e 's/Gestionar Usuarios/Manage Users/g' \
  -e 's/Cerrar Sesión/Log Out/g' \
  -e 's/Dashboard Admin/Admin Dashboard/g' \
  -e 's/Dividir Config/Split Config/g' \
  -e 's/Limpiar Datos/Clean Data/g' \
  -e 's/¿Está seguro de que desea recargar Squid?.*el servicio\./Are you sure you want to reload Squid? This will apply configuration changes without interrupting the service./g' \
  -e 's/¿Está seguro de que desea reiniciar Squid?.*el servicio\./Are you sure you want to restart Squid? This will temporarily interrupt the service./g' \
  -e 's/Error al recargar Squid/Error reloading Squid/g' \
  -e 's/Error al reiniciar Squid/Error restarting Squid/g' \
  -e 's/Configuración/Configuration/g' \
  templates/admin/base.html

# --- logs.html (admin) ---
sed -i \
  -e 's/Líneas a mostrar:/Lines to display:/g' \
  -e 's/Mostrando últimas/Showing last/g' \
  -e 's/líneas de cada log/lines of each log/g' \
  -e 's/líneas/lines/g' \
  templates/admin/logs.html

# ============================================================
# Templates - Components
# ============================================================

# --- navbar.html ---
for f in templates/components/navbar.html templates/admin/navbar.html; do
  [ -f "$f" ] && sed -i \
    -e 's/Notificaciones/Notifications/g' \
    -e 's/Panel principal con conexiones activas/Main panel with active connections/g' \
    -e 's/Inicio/Home/g' \
    -e 's/Estadísticas de rendimiento del cache/Cache performance statistics/g' \
    -e 's/Estadísticas/Statistics/g' \
    -e 's/Actividad y logs de usuarios/User activity and logs/g' \
    -e 's/Reportes y gráficas avanzadas/Advanced reports and charts/g' \
    -e 's/Reportes/Reports/g' \
    -e 's/Sitios bloqueados y actividad restringida/Blocked sites and restricted activity/g' \
    -e 's/Auditoría de actividad por usuario y fecha/Activity audit by user and date/g' \
    -e 's/Auditoría/Audit/g' \
    -e 's/Ver todas las notificaciones/View all notifications/g' \
    -e 's/Panel de administración del sistema/System administration panel/g' \
    -e 's/Actualizar paquetes y configuración de Squid/Update Squid packages and configuration/g' \
    -e 's/Actualizar aplicación web SquidStats/Update SquidStats web application/g' \
    -e 's/Cargando notificaciones\.\.\./Loading notifications.../g' \
    -e 's/Conectado al servidor de notificaciones Squid/Connected to Squid notification server/g' \
    -e 's/No hay notificaciones nuevas/No new notifications/g' \
    -e 's/¿Estás seguro de que deseas actualizar el servicio Squid?.*automáticamente\./Are you sure you want to update the Squid service? Save your configuration before continuing; the service will restart automatically./g' \
    -e 's/Error al actualizar Squid/Error updating Squid/g' \
    -e 's/Error de conexión/Connection error/g' \
    -e 's/¿Estás seguro de que deseas actualizar SquidStats?.*actualizados\./Are you sure you want to update SquidStats? The web interface, features, and security fixes will be updated./g' \
    -e 's/Error al actualizar la aplicación web/Error updating the web application/g' \
    -e 's/CSRF token meta tag no encontrado/CSRF token meta tag not found/g' \
    -e 's/Error al marcar notificación como leída/Error marking notification as read/g' \
    -e 's/Error del servidor al marcar como leída/Server error marking as read/g' \
    -e 's/Error desconocido/Unknown error/g' \
    "$f"
done

# --- confirm_modal.html ---
[ -f templates/components/confirm_modal.html ] && sed -i \
  -e 's/Confirmar Acción/Confirm Action/g' \
  -e 's/Cancelar/Cancel/g' \
  -e 's/Confirmar/Confirm/g' \
  templates/components/confirm_modal.html

# --- loading_spinner.html ---
[ -f templates/components/loading_spinner.html ] && sed -i \
  -e 's/Importando lista de bloqueo/Importing blocklist/g' \
  -e 's/Validando URL y procesando dominios\.\.\./Validating URL and processing domains.../g' \
  templates/components/loading_spinner.html

# ============================================================
# Templates - error.html
# ============================================================

sed -i \
  -e 's/Disculpamos las molestias\. Por favor, intenta de nuevo más tarde o contacta al soporte si el problema persiste\./We apologize for the inconvenience. Please try again later or contact support if the problem persists./g' \
  -e 's/Volver al Inicio/Back to Home/g' \
  templates/error.html

# ============================================================
# Templates - all_notifications.html
# ============================================================

sed -i \
  -e 's/No leídas/Unread/g' \
  -e 's/Marcar todas/Mark all/g' \
  -e 's/Eliminar todas/Delete all/g' \
  -e 's/Filtrar por:/Filter by:/g' \
  -e 's/Todos los tipos/All types/g' \
  -e 's/Errores/Errors/g' \
  -e 's/Advertencias/Warnings/g' \
  -e 's/Éxitos/Successes/g' \
  -e 's/Información/Information/g' \
  -e 's/Todas las fuentes/All sources/g' \
  -e 's/Todos los estados/All statuses/g' \
  -e 's/Sin leer/Unread/g' \
  -e 's/Leída/Read/g' \
  -e 's/Limpiar filtros/Clear filters/g' \
  -e 's/Mostrando/Showing/g' \
  -e 's/ de / of /g' \
  -e 's/notificaciones/notifications/g' \
  -e 's/Página/Page/g' \
  -e 's/No hay notificaciones/No notifications/g' \
  -e 's/Todas las notificaciones aparecerán aquí\. ¡Mantente atento a las actualizaciones del sistema!/All notifications will appear here. Stay tuned for system updates!/g' \
  -e 's/Marcar como leída/Mark as read/g' \
  -e 's/Eliminar notificación/Delete notification/g' \
  -e 's/No leída/Unread/g' \
  -e 's/Error al cargar notificaciones/Error loading notifications/g' \
  -e 's/Hace unos momentos/A few moments ago/g' \
  -e 's/Hace/ago/g' \
  -e 's/minutos/minutes/g' \
  -e 's/minuto/minute/g' \
  -e 's/horas/hours/g' \
  -e 's/hora/hour/g' \
  -e 's/días/days/g' \
  -e 's/día/day/g' \
  -e 's/notificación(es) marcada(s) como leída(s)/notification(s) marked as read/g' \
  -e 's/Error al marcar notificaciones como leídas:/Error marking notifications as read:/g' \
  -e 's/Error de conexión:/Connection error:/g' \
  -e 's/No hay notificaciones sin leer/No unread notifications/g' \
  -e 's/¿Estás seguro de que quieres eliminar esta notificación?/Are you sure you want to delete this notification?/g' \
  -e 's/Notificación eliminada/Notification deleted/g' \
  -e 's/Error al eliminar notificación:/Error deleting notification:/g' \
  -e 's/¿Estás seguro de que quieres eliminar TODAS las notificaciones?.*deshacer\./Are you sure you want to delete ALL notifications? This action cannot be undone./g' \
  -e 's/Todas las notificaciones han sido eliminadas/All notifications have been deleted/g' \
  -e 's/Error al eliminar notificaciones:/Error deleting notifications:/g' \
  -e 's/Filtros limpiados/Filters cleared/g' \
  templates/all_notifications.html

# ============================================================
# Templates - cacheView.html
# ============================================================

sed -i \
  -e 's/Uso de CPU (%)/CPU Usage (%)/g' \
  -e 's/RAM Usada/RAM Used/g' \
  -e 's/Swap Usada/Swap Used/g' \
  -e 's/Subida (Mbps)/Upload (Mbps)/g' \
  -e 's/Bajada (Mbps)/Download (Mbps)/g' \
  -e 's/Error al cargar historial de métricas:/Error loading metrics history:/g' \
  templates/cacheView.html

# ============================================================
# Templates - logsView.html
# ============================================================

sed -i \
  -e 's/Buscar por usuario\.\.\./Search by user.../g' \
  -e 's/Limpiar búsqueda/Clear search/g' \
  templates/logsView.html

# ============================================================
# Templates - reports.html
# ============================================================

sed -i \
  -e 's/Número de Visitas/Number of Visits/g' \
  -e 's/Datos Transmitidos (MB)/Data Transmitted (MB)/g' \
  -e 's/Datos (MB)/Data (MB)/g' \
  -e 's/Visitas/Visits/g' \
  -e 's/Ver/View/g' \
  templates/reports.html

# ============================================================
# Templates - Partials
# ============================================================

# --- auditoria.html ---
sed -i \
  -e 's/Tipo de Auditoría/Audit Type/g' \
  -e 's/Actividad General/General Activity/g' \
  -e 's/Resumen por Usuario/Summary by User/g' \
  -e 's/Top 10 Usuarios (Datos)/Top 10 Users (Data)/g' \
  -e 's/Top 15 URLs (Datos)/Top 15 URLs (Data)/g' \
  -e 's/Top 10 Usuarios (Peticiones)/Top 10 Users (Requests)/g' \
  -e 's/Top 10 IPs (Datos)/Top 10 IPs (Data)/g' \
  -e 's/Total de Datos Consumidos/Total Data Consumed/g' \
  -e 's/Seguridad y Políticas/Security and Policies/g' \
  -e 's/Búsqueda por Palabra Clave/Search by Keyword/g' \
  -e 's/Actividad en Redes Sociales/Social Media Activity/g' \
  -e 's/Auditoría Técnica/Technical Audit/g' \
  -e 's/Actividad por Dirección IP/Activity by IP Address/g' \
  -e 's/Análisis por Código de Respuesta/Analysis by Response Code/g' \
  -e 's/Buscar usuario\.\.\./Search user.../g' \
  -e 's/Palabra Clave/Keyword/g' \
  -e 's/Ej: juegos, descargas\.\.\./E.g.: games, downloads.../g' \
  -e 's/Dirección IP/IP Address/g' \
  -e 's/Redes Sociales/Social Media/g' \
  -e 's/Selección múltiple/Multiple selection/g' \
  -e 's/Código HTTP/HTTP Code/g' \
  -e 's/-- Seleccione un código --/-- Select a code --/g' \
  -e 's/Fecha del Reporte/Report Date/g' \
  -e 's/Fecha de Fin/End Date/g' \
  -e 's/Fecha/Date/g' \
  -e 's/Generar Reporte/Generate Report/g' \
  -e 's/Seleccione los filtros y genere un reporte/Select the filters and generate a report/g' \
  -e 's/Los resultados de su auditoría aparecerán aquí\./Your audit results will appear here./g' \
  templates/partials/auditoria.html

# --- black_list.html ---
sed -i \
  -e 's/Total de registros:/Total records:/g' \
  -e 's/Mostrar:/Show:/g' \
  -e 's/Intentos Bloqueados/Blocked Attempts/g' \
  -e 's/URLs reales:/Actual URLs:/g' \
  -e 's/No se encontraron registros/No records found/g' \
  -e 's/No hay actividad en sitios bloqueados para mostrar\./No blocked site activity to display./g' \
  -e 's/Mostrando/Showing/g' \
  -e 's/grupos de usuarios en esta página\./user groups on this page./g' \
  -e 's/Anterior/Previous/g' \
  -e 's/Siguiente/Next/g' \
  templates/partials/black_list.html

# --- cache_stats.html ---
sed -i \
  -e 's/Sistema/System/g' \
  -e 's/Caché/Cache/g' \
  -e 's/Red/Network/g' \
  -e 's/Estadísticas del Sistema/System Statistics/g' \
  -e 's/núcleos/cores/g' \
  -e 's/Información del Sistema/System Information/g' \
  -e 's/Nombre del Host/Hostname/g' \
  -e 's/Direcciones IP/IP Addresses/g' \
  -e 's/Sistema Operativo/Operating System/g' \
  -e 's/Tiempo Encendido/Uptime/g' \
  -e 's/Zona Horaria/Time Zone/g' \
  -e 's/Hora Local/Local Time/g' \
  -e 's/Gráficas del Sistema/System Charts/g' \
  -e 's/Hoy/Today/g' \
  -e 's/24 Horas/24 Hours/g' \
  -e 's/Estadísticas de Caché/Cache Statistics/g' \
  -e 's/Entradas [Aa]lmacenadas/Stored Entries/g' \
  -e 's/Número de objetos actualmente en la caché de Squid\./Number of objects currently in the Squid cache./g' \
  -e 's/Uso de capacidad/Capacity usage/g' \
  -e 's/Porcentaje del almacenamiento de caché en uso actualmente\./Percentage of cache storage currently in use./g' \
  -e 's/Espacio total/Total space/g' \
  -e 's/Tamaño total del disco asignado a la caché de Squid\./Total disk size allocated to the Squid cache./g' \
  -e 's/No disponible/Not available/g' \
  -e 's/Espacio usado/Used space/g' \
  -e 's/Cantidad de espacio de disco ya ocupado por objetos en caché\./Amount of disk space already occupied by cached objects./g' \
  -e 's/Eliminación/Eviction/g' \
  -e 's/Política de eliminación/Eviction policy/g' \
  -e 's/Método que Squid usa para eliminar objetos antiguos de la caché\./Method Squid uses to evict old objects from the cache./g' \
  -e 's/Edad LRU/LRU Age/g' \
  -e 's/Tiempo desde que el objeto menos usado fue accedido por última vez\./Time since the least recently used object was last accessed./g' \
  -e 's/Tráfico de Red/Network Traffic/g' \
  templates/partials/cache_stats.html

# --- conexiones.html ---
sed -i \
  -e 's/Servidor Squid:/Squid Server:/g' \
  -e 's/Usuarios Activos/Active Users/g' \
  -e 's/Conexiones Totales/Total Connections/g' \
  -e 's/Conexiones totales de este usuario/Total connections for this user/g' \
  -e 's/Tiempo Activo/Uptime/g' \
  -e 's/Peticiones HTTP/HTTP Requests/g' \
  -e 's/Peticiones\/Min/Requests\/Min/g' \
  -e 's/Estado Squid/Squid Status/g' \
  -e 's/Conectado/Connected/g' \
  -e 's/Rechazado/Rejected/g' \
  -e 's/Tipo de Sistema/System Type/g' \
  -e 's/Ver Resumen/View Summary/g' \
  -e 's/IP del Cliente/Client IP/g' \
  -e 's/Total de velocidad del usuario/User total speed/g' \
  -e 's/Total de datos transferidos/Total data transferred/g' \
  -e 's/Total de solicitudes/Total requests/g' \
  -e 's/Duración/Duration/g' \
  -e 's/Método/Method/g' \
  -e 's/Datos/Data/g' \
  -e 's/Velocidad/Speed/g' \
  -e 's/Solicitudes/Requests/g' \
  -e 's/Dir\. Remota/Remote Addr./g' \
  -e 's/conexiones/connections/g' \
  templates/partials/conexiones.html

# --- graph_reports.html ---
sed -i \
  -e 's/Usuarios Totales/Total Users/g' \
  -e 's/Registros de Log/Log Records/g' \
  -e 's/Datos Transmitidos/Data Transmitted/g' \
  -e 's/Top 20 Usuarios por Actividad/Top 20 Users by Activity/g' \
  -e 's/Top 20 Usuarios por Datos Transmitidos/Top 20 Users by Data Transmitted/g' \
  -e 's/Distribución de Códigos HTTP/HTTP Code Distribution/g' \
  -e 's/Top 20 Páginas Más Visitadas/Top 20 Most Visited Pages/g' \
  -e 's/Visitas Únicas/Unique Visits/g' \
  -e 's/IPs Compartidas por Múltiples Usuarios/IPs Shared by Multiple Users/g' \
  -e 's/Número de Usuarios/Number of Users/g' \
  templates/partials/graph_reports.html

# ============================================================
# Common words across all templates (catch remaining)
# ============================================================

find templates -name '*.html' -exec sed -i \
  -e 's/>Usuario</>Username</g' \
  -e 's/>Contraseña</>Password</g' \
  -e 's/>Rol</>Role</g' \
  -e 's/>Estado</>Status</g' \
  -e 's/>Activo</>Active</g' \
  -e 's/>Inactivo</>Inactive</g' \
  -e 's/>Configuración</>Configuration</g' \
  -e 's/>General</>General</g' \
  {} +

echo "Translation complete!"
