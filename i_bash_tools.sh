#!/bin/bash

sudo apt-get install -y gawk

# Working with csvs

cd
git clone https://github.com/dbro/csvquote.git
cd csvquote
make
sudo make install
