#!/bin/bash
## Install cinnamon ppa
sudo add-apt-repository -yppa:lestcape/cinnamon
## install docky ppa
sudo add-apt-repository -y ppa:ricotz/docky
## update and install 
sudo apt-get update && sudo apt-get install -y cinnamon plank
