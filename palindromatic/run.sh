#!/bin/sh

set -e

gcc rootfs/tmp/exploit.c -o rootfs/tmp/exploit -static

qemu-system-x86_64 \
    -m 64M \
    -cpu kvm64,+smep,+smap \
    -kernel bzImage \
    -drive file=rootfs.ext3,format=raw \
    -drive file=exploit,format=raw \
    -snapshot \
    -s \
    -nographic \
    -monitor /dev/null \
    -no-reboot \
    -append "root=/dev/sda rw init=/init console=ttyS0 nokaslr kpti=1 loglevel=0 oops=panic panic=-1"
