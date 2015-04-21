#!/bin/bash
sudo apt-get install -y postgresql-9.4-postgis-2.1 postgresql-9.4-postgis-2.1-scripts postgis
psql -c "CREATE EXTENSION postgis;CREATE EXTENSION postgis_topology;CREATE EXTENSION fuzzystrmatch;CREATE EXTENSION postgis_tiger_geocoder;"

