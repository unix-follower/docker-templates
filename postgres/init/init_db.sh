#!/bin/bash
set -e

# bash /tmp/path/to/folder/init_db.sh

# Keycloak
# psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
#     CREATE ROLE keycloak WITH LOGIN NOCREATEROLE NOCREATEDB NOREPLICATION NOSUPERUSER PASSWORD 'keycloak';
#     CREATE DATABASE keycloak OWNER keycloak;
# EOSQL

# Grafana
# psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
#     CREATE ROLE grafana WITH LOGIN NOCREATEROLE NOCREATEDB NOREPLICATION NOSUPERUSER PASSWORD 'grafana';
#     CREATE DATABASE grafana OWNER grafana;
# EOSQL
