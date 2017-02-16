#!/bin/bash
mkdir -p $HOME/src
cd $HOME/src
wget http://ftp.gnu.org/gnu/parallel/parallel-latest.tar.bz2
tar -xvf parallel-latest.tar.bz2
cd "$(ls -dt parallel-*/ | head -1 )"
./configure
make
sudo make install
cd
rm `ls parallel-latest.*`
