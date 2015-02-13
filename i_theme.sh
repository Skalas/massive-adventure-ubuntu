#!/bin/bash
sudo add-apt-repository -y ppa:noobslab/themes
sudo add-apt-repository -y ppa:noobslab/icons
sudo apt-get update
sudo apt-get install ultra-flat-icons
sudo apt-get install royal-gtk-theme
## Usar sourcecodePro como font
[ -d /usr/share/fonts/opentype ] || sudo mkdir /usr/share/fonts/opentype
sudo git clone https://github.com/adobe-fonts/source-code-pro.git /usr/share/fonts/opentype/scp
sudo fc-cache -f -v
## Uso base16 ocean dark.
source ./base16-gnome-terminal/base16-ocean.dark.sh
