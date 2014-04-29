#!/bin/bash

# Postgres 9.3

sudo apt-get update
sudo apt-get -y install python-software-properties
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" >> /etc/apt/sources.list.d/postgresql.list'
sudo apt-get update
sudo apt-get install postgresql-9.3 libpq5 postgresql-contrib

# Buena practica: detener cluster y nombrar nuevo

cd
sudo pg_dropcluster --stop 9.3 main
sudo mkdir /data
sudo chown -R postgres:postgres /data
sudo pg_createcluster -d /data 9.3 main

# Postgis
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" >> /etc/apt/sources.list.d/postgresql.list'
sudo apt-get update
echo 'y' | sudo apt-get install postgresql-9.3-postgis-2.1 -f

# crea el usuario animalito (usr) y metele ahi(se pone loco por no tener un user)

createdb -E UTF8 template_postgis2.1
psql -d postgres -c "UPDATE pg_database SET datistemplate='true' WHERE datname='template_postgis2.1'"
psql -d template_postgis2.1 -f /usr/share/postgresql/9.3/extension/postgis--2.1.2.sql
psql -d template_postgis2.1 -c "GRANT ALL ON geometry_columns TO PUBLIC;"
psql -d template_postgis2.1 -c "GRANT ALL ON geography_columns TO PUBLIC;"
psql -d template_postgis2.1 -c "GRANT ALL ON spatial_ref_sys TO PUBLIC;"
createdb test_db -T template_postgis2.1
