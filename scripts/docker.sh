#!/bin/sh -x

echo "docker.sh"

# install mandatory packages
aptitude update
aptitude install -y \
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
aptitude install -y docker-ce

# https://docs.docker.com/install/linux/linux-postinstall/#configure-where-the-docker-daemon-listens-for-connections
systemctl enable docker
mkdir -p /etc/systemd/system/docker.service.d/
echo '[Service]' > /etc/systemd/system/docker.service.d/override.conf
echo 'ExecStart=' >> /etc/systemd/system/docker.service.d/override.conf
echo 'ExecStart=/usr/bin/dockerd --dns 1.1.1.1 -H unix:// -H tcp://0.0.0.0:2375' >> /etc/systemd/system/docker.service.d/override.conf

systemctl daemon-reload

# add docker group and add vagrant to it
groupadd docker
usermod -a -G docker vagrant

curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
