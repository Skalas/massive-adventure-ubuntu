#!/bin/bash
## We check that we can manage this
ubuntu_codename=`lsb_release -cs`
sudo bash <<EOF
## We get the public keys
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
## We add the repository to the sources
echo "deb https://apt.dockerproject.org/repo ubuntu-$ubuntu_codename main" > /etc/apt/sources.list.d/docker.list
apt-get update
apt-get install -y docker-engine
EOF
sudo gpasswd -a ${USER} docker
sudo service docker restart
