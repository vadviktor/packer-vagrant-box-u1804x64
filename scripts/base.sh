#!/bin/bash -eux

aptitude update && \
aptitude full-upgrade -y && \
aptitude install -y cifs-utils \
                    git

sed -i -e 's/noatime,/noatime,acl,/g' /etc/fstab

echo %vagrant ALL=NOPASSWD:ALL > /etc/sudoers.d/vagrant
chmod 0440 /etc/sudoers.d/vagrant
usermod -a -G sudo vagrant

echo "UseDNS no" >> /etc/ssh/sshd_config

echo "fs.inotify.max_user_watches = 524288" > /etc/sysctl.d/55-watch.conf
echo "vm.swappiness = 0" > /etc/sysctl.d/50-swappiness.conf
