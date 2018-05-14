#!/bin/bash -eux

aptitude install -y dkms

mkdir -p /mnt/cdrom
mount -o loop ~/VBoxGuestAdditions.iso /mnt/cdrom
/mnt/cdrom/VBoxLinuxAdditions.run --nox11
umount /mnt/cdrom
rm -rf ~/VBoxGuestAdditions.iso

usermod -a -G vboxsf vagrant
