cd 
wget http://download.redis.io/releases/redis-2.8.19.tar.gz
tar xzf redis-2.8.19.tar.gz
cd redis-2.8.19
make
make test && sudo make install
cd ..
rm -rf redis-2.8.19
