sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D2C19886
echo 'deb http://repository.spotify.com stable non-free' | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get install -y spotify-client
cd /tmp/
wget http://ftp.acc.umu.se/mirror/cdimage/snapshot/Debian/pool/main/libg/libgcrypt11/libgcrypt11_1.5.3-5_amd64.deb
dpkg -i libgcrypt11_1.5.3-5_amd64.deb
