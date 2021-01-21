#!/bin/bash
## We check that we can manage this
sudo bash <<EOF
## Prerequisites
apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

## We get the public keys
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
## We add the repository to the sources
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   focal \
   stable"
apt update
apt install -y docker-ce docker-ce-cli containerd.io
EOF
sudo gpasswd -a ${USER} docker
sudo service docker restart
