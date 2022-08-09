#!/bin/bash
## We check that we can manage this
sudo bash <<EOF
## Prerequisites
apt update
apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
## We get the public keys
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" |\
 sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt update
apt-cache policy docker-ce
apt install -y docker-ce
EOF
sudo gpasswd -a ${USER} docker
sudo service docker restart
