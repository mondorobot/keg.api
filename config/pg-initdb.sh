#!/bin/sh -e

psql --variable=ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
  CREATE DATABASE "$DATABASE_NAME";
EOSQL

# UUID v1mc reduces the negative side effect of using random primary keys
# with respect to keyspace fragmentation on disk for the tables because it's time based
# https://www.postgresql.org/docs/current/static/uuid-ossp.html
psql --variable=ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname=$DATABASE_NAME <<-EOSQL
  CREATE EXTENSION "uuid-ossp";
  CREATE EXTENSION "hstore";
EOSQL
