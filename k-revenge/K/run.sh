#!/bin/bash


cd rootfs

gcc exploit.c -o exploit -static


find . -print0 | cpio --null -ov --format=newc > ../rootfs.cpio
cd ..
gzip -f rootfs.cpio

exec timeout --foreground 300 qemu-system-x86_64 \
	-m 64M \
        -cpu kvm64,+smep,+smap \
        -nographic \
        -monitor /dev/null \
        -kernel bzImage \
        -initrd rootfs.cpio.gz \
	-no-reboot \
	-s \
	-append "console=ttyS0 quiet kaslr panic=1 nopti oops=panic" \
	-net user -net nic -device e1000 \
