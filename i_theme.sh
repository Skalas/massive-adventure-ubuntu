#!/bin/bash
sudo add-apt-repository -y ppa:noobslab/themes
sudo add-apt-repository -y ppa:noobslab/icons
sudo apt-get update
sudo apt-get install -y ultra-flat-icons
sudo apt-get install -y  arc-theme
##Usar sourcecodePro como font
mkdir /tmp/adodefont
cd /tmp/adodefont
wget https://github.com/adobe-fonts/source-code-pro/archive/1.017R.zip
unzip 1.017R.zip
mkdir -p ~/.fonts
cp source-code-pro-1.017R/OTF/*.otf ~/.fonts
fc-cache -f -v
## Uso base16 ocean dark.
./base16-gnome-terminal/base16-ocean.dark.sh
