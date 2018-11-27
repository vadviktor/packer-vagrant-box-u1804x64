#!/bin/bash

echo "zerodisk.sh"

dd if=/dev/zero of=/EMPTY bs=1M
