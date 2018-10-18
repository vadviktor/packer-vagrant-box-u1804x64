#!/bin/bash

echo "motd.sh"

sed -i -e "s/motd=\/run\/motd.dynamic/motd=\/etc\/motd/g" /etc/pam.d/sshd
sed -i -e "s/motd=\/run\/motd.dynamic/motd=\/etc\/motd/g" /etc/pam.d/login

cat << EOF > /etc/motd
EOF
