#!/bin/sh

set -e

./employee.sh compress

exec qemu-system-x86_64 \
     -m 64M \
     -nographic \
     -kernel vm/bzImage \
     -append "console=ttyS0 loglevel=3 oops=panic panic=-1 nopti nokaslr" \
     -no-reboot \
     -cpu qemu64 \
     -monitor /dev/null \
     -s \
     -initrd vm/rootfs_updated.cpio \
     -net nic,model=virtio \
     -net user
