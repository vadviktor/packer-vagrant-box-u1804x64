#!/bin/bash -eux

dd if=/dev/zero of=/EMPTY bs=1M
rm -rf /EMPTY
# Add `sync` so Packer doesn't quit too early, before the large file is deleted.
sync