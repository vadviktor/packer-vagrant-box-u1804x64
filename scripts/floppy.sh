#!/bin/bash

echo "floppy.sh"

printf 'blacklist floppy\n' > /etc/modprobe.d/floppy.conf
mkinitramfs -o /boot/initrd.img-$(uname -r) $(uname -r)

