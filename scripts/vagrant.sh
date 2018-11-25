#!/bin/bash

echo "vagrant.sh"

sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers
printf "vagrant ALL=(ALL) NOPASSWD: ALL\n" > /etc/sudoers.d/vagrant
chmod 0440 /etc/sudoers.d/vagrant
usermod -a -G sudo vagrant

mkdir -p /home/vagrant/.ssh
wget --no-check-certificate \
    'https://gist.githubusercontent.com/vadviktor/5cb616f164aa2e4f266a/raw/b0c22c8d34d5a3e7a1e596c4e2f55bcd7111951f/vagrant_rsa.pub' \
    -O /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh
chmod -R go-rwsx /home/vagrant/.ssh
