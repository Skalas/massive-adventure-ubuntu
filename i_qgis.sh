#!/bin/bash
ubuntu_codename=`lsb_release -cs`
echo "deb     http://qgis.org/debian $ubuntu_codename main" | sudo tee  /etc/apt/sources.list.d/qgis.list
echo "deb-src http://qgis.org/debian $ubuntu_codename main" | sudo tee -a /etc/apt/sources.list.d/qgis.list
gpg --keyserver keyserver.ubuntu.com --recv DD45F6C3
gpg --export --armor DD45F6C3 | sudo apt-key add -
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install qgis python-qgis qgis-plugin-grass
