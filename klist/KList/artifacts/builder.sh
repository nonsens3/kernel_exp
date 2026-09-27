#!/bin/sh

gcc -static rootfs/home/user/exploit.c -o rootfs/home/user/exploit

cd rootfs
find . -print0 | cpio --null -ov --format=newc | gzip -9 > ../rootfs_updated.cpio.gz
