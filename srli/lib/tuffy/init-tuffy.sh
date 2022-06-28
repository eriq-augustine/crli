#!/bin/bash

set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    DROP DATABASE IF EXISTS tuffy;
    CREATE DATABASE tuffy;

    \c tuffy;

    DROP USER IF EXISTS tuffy;
    CREATE USER tuffy WITH
        PASSWORD 'tuffy'
        SUPERUSER
        NOINHERIT;

    GRANT ALL PRIVILEGES ON DATABASE tuffy TO tuffy;

    CREATE extension intarray;
    CREATE extension intagg;
EOSQL
