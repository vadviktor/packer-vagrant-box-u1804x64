#!/bin/bash -eux

# install mandatory packages
aptitude update
aptitude install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
aptitude update
aptitude install docker-ce

# https://docs.docker.com/engine/reference/commandline/dockerd//#daemon-configuration-file
touch /etc/docker/daemon.json
echo "{" >> touch /etc/docker/daemon.json
echo '"iptables": false,' >> touch /etc/docker/daemon.json
echo '"dns": [1.1.1.1]' >> touch /etc/docker/daemon.json
echo "}" >> touch /etc/docker/daemon.json

# add docker group and add vagrant to it
groupadd docker
usermod -a -G docker vagrant
