#!/bin/sh -x

echo "zerodisk.sh"

dd if=/dev/zero of=/EMPTY bs=1M
rm -rfv /EMPTY
sync
