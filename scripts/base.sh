#!/bin/bash

echo "base.sh"

sed -i -e 's/noatime,/noatime,acl,/g' /etc/fstab

echo "UseDNS no" >> /etc/ssh/sshd_config

echo "fs.inotify.max_user_watches = 524288" > /etc/sysctl.d/55-watch.conf
echo "vm.swappiness = 0" > /etc/sysctl.d/50-swappiness.conf

aptitude install -y haveged
systemctl enable haveged.service

chown -R vagrant:vagrant /home/vagrant/bin
chmod -R u+x /home/vagrant/bin

chsh -s /bin/zsh vagrant
