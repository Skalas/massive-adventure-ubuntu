#!/bin/bash
while true; do
    read -p "Do you wish to Compile R? y/n " yn
    case $yn in
        [Yy]* ) sudo apt-get update;
	    sudo apt-get upgrade -y;
	    sudo apt-get install -y build-essential libpq-dev liblapack3 libblas3 libmysql++-dev sqlite3 fort77 gnuplot-x11  texinfo liblapack-dev texi2html libglpk-dev libgeos-dev libgdal1-dev libproj-dev;
	    sudo apt install -y gfortran  autoconf automake bzip2-doc cdbs debhelper dh-strip-nondeterminism dh-translations gettext intltool intltool-debian libarchive-zip-perl libasprintf-dev libbz2-dev libfile-stripnondeterminism-perl libgettextpo-dev libgettextpo0 liblzma-dev libmail-sendmail-perl libncurses5-dev libpcre3-dev libpcre32-3 libpcrecpp0v5 libreadline-dev libreadline6-dev libsys-hostname-long-perl libtinfo-dev libunistring0 m4 po-debconf python-scour xorg-dev libcairo2-dev libgtk2.0-dev;
	    sudo apt-get -y build-dep r-base;
	    mkdir -p $HOME/src;
	    cd $HOME/src;
	    wget -c http://cran.r-project.org/src/base/R-latest.tar.gz;
	    tar zxvf R-latest.tar.gz && rm R-latest.tar.gz;
	    cd "$(ls -dt R-*/ | head -1 )";
	    ./configure --enable-memory-profiling --enable-R-shlib --with-blas --with-lapack --with-tcltk  --with-cairo --with-libpng --with-jpeglib --with-libtiff;
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

