#!/bin/bash

set -e

cd initramfs/

gcc exploit.c -o exploit -static -pthread

find . -print0 | cpio --null -ov --format=newc --owner=0:0 > ../rootfs_updated.cpio

cd ..

./qemu-system-x86_64 \
	-m 3G \
	-L ./pc-bios \
	-kernel ./bzImage \
	-initrd ./rootfs_updated.cpio \
	-nographic \
	-s \
	-cpu qemu64 \
	-net nic,model=virtio -net user \
	-monitor /dev/null \
	-append 'console=ttyS0 loglevel=3 oops=panic panic=1 nokaslr' \
	-smp cores=2
