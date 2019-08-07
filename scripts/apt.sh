#!/bin/sh -x

echo "apt.sh"

# To allow for automated installs, we disable interactive configuration steps.
export DEBIAN_FRONTEND=noninteractive
export DEBCONF_NONINTERACTIVE_SEEN=true

# Temporarily disable IPv6, update the nameservers so packages download
# properly. A more permanent soulution is applied by the network
# configuration script.
sysctl net.ipv6.conf.all.disable_ipv6=1
printf "nameserver 1.1.1.1" > /etc/resolv.conf

# Disable upgrades to new releases.
sed -i -e 's/^Prompt=.*$/Prompt=never/' /etc/update-manager/release-upgrades;

# Disable periodic activities of apt
printf "APT::Periodic::Enable \"0\";\n" >> /etc/apt/apt.conf.d/10periodic

# Keep the daily apt updater from deadlocking our installs.
systemctl stop apt-daily.service apt-daily.timer
systemctl stop snapd.service snapd.socket snapd.refresh.timer

aptitude update && \
aptitude full-upgrade -y && \
aptitude install -y virtualbox-guest-utils \
                    cifs-utils \
                    jq \
                    silversearcher-ag \
                    figlet \
                    tree \
                    rsync \
                    zsh-syntax-highlighting \
                    zsh \
                    byobu \
                    unzip
