sudo apt-get update
yes|sudo apt-get upgrade
yes|sudo apt-get install build-essential libpq-dev liblapack3 libblas3 libmysql++-dev sqlite3 fort77 xorg-dev texinfo liblapack-dev liblapack3gf texi2html libglpk-dev
cd
wget -c http://cran.r-project.org/src/base/R-latest.tar.gz
sudo mv /usr/lib/libf2c.so /usr/lib/libf2c.so_backup
sudo ln -s /usr/lib/libf2c.a /usr/lib/libf2c.so

tar zxvf R-latest.tar.gz
cd "$(ls -dt R-*/ | head -1 )"
./configure --enable-memory-profiling --enable-R-shlib --with-blas --with-lapack --with-system-zlib --with-system-bzlib --with-system-xz --with-tcltk  --with-cairo --with-libpng --with-jpeglib --with-libtiff
make
sudo 	make install
