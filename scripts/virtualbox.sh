#!/bin/sh -x

echo "virtualbox.sh"

mkdir -p /mnt/cdrom
mount -o loop,ro ~/VBoxGuestAdditions.iso /mnt/cdrom
sh /mnt/cdrom/VBoxLinuxAdditions.run
umount /mnt/cdrom
rm -rf /mnt/cdrom
rm -rf ~/VBoxGuestAdditions.iso

usermod -a -G vboxsf vagrant
