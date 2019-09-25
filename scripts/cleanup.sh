#!/bin/sh -x

echo "cleanup.sh"

error() {
        if [ $? -ne 0 ]; then
                printf "\n\napt failed...\n\n";
                exit 1
        fi
}

# To allow for automated installs, we disable interactive configuration steps.
export DEBIAN_FRONTEND=noninteractive
export DEBCONF_NONINTERACTIVE_SEEN=true

# Cleanup unused packages.
dpkg --configure -a; error
apt --assume-yes autoremove; error
apt --assume-yes autoclean; error

echo "cleaning up dhcp leases"
rm -rf /var/lib/dhcp/*
