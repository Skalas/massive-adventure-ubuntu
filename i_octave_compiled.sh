cd
echo 'y' | sudo apt-get install gfortran debhelper automake dh-autoreconf texinfo texlive-latex-base texlive-generic-recommended epstool transfig pstoedit libreadline-dev libncurses5-dev gperf libhdf5-serial-dev libblas-dev liblapack-dev libfftw3-dev texi2html less libpcre3-dev flex libglpk-dev libsuitesparse-dev gawk ghostscript libcurl4-gnutls-dev libqhull-dev desktop-file-utils libfltk1.3-dev libgl2ps-dev libgraphicsmagick++1-dev libftgl-dev libfontconfig1-dev libqrupdate-dev libarpack2-dev dh-exec libqt4-dev libqscintilla2-dev default-jdk dpkg-dev gnuplot-x11 libbison-dev libxft-dev llvm-dev

wget -P . http://ftp.gnu.org/pub/gnu/octave/octave-3.8.1.tar.bz2

tar -xvf octave-3.8.1.tar.bz2
cd octave-3.8.1
./configure --enable-jit --with-blas --with-lapack --prefix=/opt/octave3.8
make
make check
sudo make install 
sudo ln -s /opt/octave3.8/bin/octave /usr/local/bin/octave3.8

