echo 'deb http://apt.postgresql.org/pub/repos/apt/ utopic-pgdg main' | sudo tee /etc/apt/sources.list.d/pgdg.list
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install postgresql-9.4
sudo -u postgres bash <<EOF
createuser "$USERER"
createdb "$USER"
psql -c "alter role $USER with login superuser;"
psql -c "alter database $USER  owner to $USER;"
EOF
