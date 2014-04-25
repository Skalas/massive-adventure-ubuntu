echo 'deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main' | sudo tee /etc/apt/sources.list.d/pgdg.list
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
echo 'y' | sudo apt-get update
echo 'y' | sudo apt-get upgrade
echo 'y' | sudo apt-get install postgresql-9.3 
