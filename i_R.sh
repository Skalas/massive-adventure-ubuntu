#!/bin/bash
while true; do
    read -p "Do you wish to Compile R? y/n " yn
    case $yn in
        [Yy]* ) sudo apt-get update;
	    sudo apt-get upgrade -y;
	    sudo apt-get install -y build-essential libpq-dev liblapack3 libblas3 libmysql++-dev sqlite3 fort77 gnuplot-x11 gfortran  texinfo liblapack-dev liblapack3gf texi2html libglpk-dev libgeos-dev libgdal1-dev libproj-dev gfortran;
	    sudo apt-get -y build-dep r-base;
	    cd;
	    wget -c http://cran.r-project.org/src/base/R-latest.tar.gz;
	    tar zxvf R-latest.tar.gz;
	    cd "$(ls -dt R-*/ | head -1 )";
	    ./configure --enable-memory-profiling --enable-R-shlib --with-blas --with-lapack --with-system-zlib --with-system-bzlib --with-system-xz --with-tcltk  --with-cairo --with-libpng --with-jpeglib --with-libtiff;
	    make;
	    sudo make install;
	    break;;
        [Nn]* ) sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9;
	    ubuntu_codename=`lsb_release -cs` ;
	    sudo chmod ugo+rw /etc/apt/sources.list;
	    echo "deb http://cran.r-project.org/bin/linux/ubuntu $ubuntu_codename/" >> '/etc/apt/sources.list';
	    sudo apt-get update;
	    sudo apt-get install -y --no-install-recommends r-base r-base-dev;
	    exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

