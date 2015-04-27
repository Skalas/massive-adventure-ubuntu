#!/bin/bash
while true; do
    read -p "Do you wish to Compile emacs? y/n " yn
    case $yn in
        [Yy]* ) sudo apt-get update;
	    sudo apt-get -y build-dep emacs24;
	    sudo apt-get -y upgrade;
	    cd ;
	    wget http://open-source-box.org/emacs/emacs-24.4.tar.xz;
	    tar -xvf emacs-24.4.tar.xz;
	    cd emacs-24.4;
	    ./configure;
	    make;
	    sudo make install ;
	    cd ;
	    rm `ls emacs-24.4.*`;
	    break;;
        [Nn]* ) sudo apt-get install -y emacs24; exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
