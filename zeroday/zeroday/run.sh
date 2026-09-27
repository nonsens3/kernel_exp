#!/bin/sh

set -e

cd initramfs/

gcc home/ctf/exploit.c -o home/ctf/exploit -static

find . -print0 | cpio --null -ov --format=newc | gzip -9 > ../initramfs_updated.cpio.gz

cd ../

qemu-system-x86_64 \
    -m 128M \
    -nographic \
    -kernel "./bzImage" \
    -append "console=ttyS0 loglevel=3 oops=panic panic=-1 pti=on" \
    -no-reboot \
    -cpu qemu64,+smep,+smap \
    -smp 2 \
    -initrd "./initramfs_updated.cpio.gz"

