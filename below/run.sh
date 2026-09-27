#!/bin/bash

set -e

cd system/

gcc exploit.c -o exploit -static


/home/glenn/.tools/stuff_kernel.sh compress


cd ../

qemu-system-x86_64 \
	-m 64 \
	-cpu kvm64,+smep\
	-kernel bzImage \
	-append "console=ttyS0 nopti  quiet"  \
	-nographic\
	-s \
	-monitor /dev/null \
	-initrd rootfs_updated.cpio \
