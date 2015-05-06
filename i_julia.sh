#!/bin/bash
while true; do
    read -p "Do you wish to Compile Julia? y/n " yn
    case $yn in
        [Yy]* ) 
	    cd ;
	    git clone git://github.com/JuliaLang/julia.git;
	    cd julia;
	    git checkout release-0.3;
	    make ;
	    break;;
        [Nn]* ) sudo add-apt-repository -y ppa:staticfloat/juliareleases;
	    sudo add-apt-repository -y ppa:staticfloat/julia-deps;
	    sudo apt-get update;
	    sudo apt-get install -y julia ;
	    exit;;
        * ) echo "Please answer yes or no.";;
    esac
done


