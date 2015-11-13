cd /tmp/
wget https://storage.googleapis.com/golang/go1.5.1.linux-amd64.tar.gz
sudo bash <<EOF
tar -C /usr/local -xzf go1.5.1.linux-amd64.tar.gz
echo "export PATH=$PATH:/usr/local/go/bin" >> /etc/profile
EOF
