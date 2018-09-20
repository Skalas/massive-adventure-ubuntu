#!/bin/bash
## We check that we can manage this
sudo bash <<EOF
## Prerequisites
apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
## We get the public keys
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
## We add the repository to the sources
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt update
apt install -y docker-ce
EOF
sudo gpasswd -a ${USER} docker
sudo service docker restart
