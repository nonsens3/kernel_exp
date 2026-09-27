#!/bin/sh

set -e

cd initramfs/

gcc exploit.c -o exploit -static

find . | cpio --create --format='newc' > ../initramfs_updated.cpio

cd ..

qemu-system-x86_64 \
    -m 128M \
    -nographic \
    -kernel "./bzImage" \
    -append "console=ttyS0 loglevel=3 oops=panic panic=-1 pti=on kaslr" \
    -no-reboot \
    -monitor none \
    -s \
    -cpu qemu64,+smep,+smap \
    -initrd "./initramfs_updated.cpio"
