#!/bin/bash
sudo apt-get -y build-dep emacs24
sudo apt-get -y upgrade
cd 
wget http://open-source-box.org/emacs/emacs-24.4.tar.xz
tar -xvf emacs-24.4.tar.xz
cd "$(ls -dt emacs*/ | head -1 )"
./configure
make
sudo make install 
cd 
rm `emacs-24.4.*`
