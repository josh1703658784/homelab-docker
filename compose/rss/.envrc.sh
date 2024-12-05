## <SECRETS> ##
MINIFLUX_PASS=
POSTGRES_PASSWORD=
WALLABAG_MYSQL_ROOT_PASSWORD=
WALLABAG_DATABASE_PASSWORD=
WALLABAG_DOMAIN_NAME=

## <SERVICES> ##
MINIFLUX_DB_APP_DATA="${DOCKER_DATA?error}/services/miniflux-db/app-data"
MINIFLUX_PORT=8080
MINIFLUX_USER='admin_boring_exciting1061'
MINIFLUX_DB_HOSTNAME='miniflux-db'

POSTGRES_DB='miniflux'
POSTGRES_USER='miniflux'
REDIS_PORT=6379
RSSHUB_PORT=1200

WALLABAG_DB_APP_DATA="${DOCKER_DATA?error}/services/wallabag-db/app-data"
WALLABAG_DATABASE_DRIVER='pdo_mysql'
WALLABAG_DATABASE_HOST='wallabag-db'
WALLABAG_DATABASE_PORT=3306
WALLABAG_DATABASE_NAME='wallbag'
WALLABAG_DATABASE_USER='wallbag'
WALLABAG_DATABASE_CHARSET='utf8mb4'
WALLABAG_DATABASE_TABLE_PREFIX='wallabag_'
WALLABAG_SERVER_NAME='wallabag'
WALLABAG_PORT=80