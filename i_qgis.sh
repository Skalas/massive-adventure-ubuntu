#!/bin/bash
ubuntu_codename=`lsb_release -cs`
echo "deb     http://qgis.org/debian $ubuntu_codename main" | sudo tee /etc/apt/sources.list.d/qgis.list
echo "deb-src http://qgis.org/debian $ubuntu_codename main" | sudo tee /etc/apt/sources.list.d/qgis.list
echo "deb     http://ppa.launchpad.net/ubuntugis/ubuntugis-unstable/ubuntu $ubuntu_codename main" | sudo tee /etc/apt/sources.list.d/qgis.list
sudo apt-get -y update
sudo apt-get -y upgrade
#sudo apt-get -y install qgis python-qgis qgis-plugin-grass
