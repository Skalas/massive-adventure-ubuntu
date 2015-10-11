#!/bin/bash
while true; do
    read -p "Do you wish to Compile Octave? y/n " yn
    case $yn in
        [Yy]* ) sudo apt-get update;
	    sudo apt-get upgrade -y;
	    sudo apt-get install -y gfortran debhelper automake dh-autoreconf texinfo texlive-latex-base texlive-generic-recommended epstool transfig pstoedit libreadline-dev libncurses5-dev gperf libhdf5-serial-dev libblas-dev liblapack-dev libfftw3-dev texi2html less libpcre3-dev flex libglpk-dev libsuitesparse-dev gawk ghostscript libcurl4-gnutls-dev libqhull-dev desktop-file-utils libfltk1.3-dev libgl2ps-dev libgraphicsmagick++1-dev libftgl-dev libfontconfig1-dev libqrupdate-dev libarpack2-dev dh-exec libqt4-dev libqscintilla2-dev default-jdk dpkg-dev gnuplot-x11 libbison-dev libxft-dev llvm-dev;
	    sudo apt-get -y build-dep octave;
	    cd;
	    wget -P . http://ftp.gnu.org/pub/gnu/octave/octave-4.0.0.tar.gz;
	    tar -xvf octave-4.0.0.tar.gz;
	    cd octave-4.0.0;
	    ./configure --enable-jit --with-blas --with-lapack --prefix=/opt/octave4.0;
	    make;
	    make check;
	    sudo make install ;
	    sudo ln -s /opt/octave4.0/bin/octave /usr/local/bin/octave;
	    break;;
        [Nn]* )
	    sudo apt-add-repository -y ppa:octave/stable;
	    sudo apt-get update;
	    sudo apt-get install -y octave;
	    exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

