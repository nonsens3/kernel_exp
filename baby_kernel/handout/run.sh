#! /bin/sh

# Note: -serial mon:stdio is here for convenience purposes.
# Remotely the chal is run with -serial stdio.

set -e

cd rootfs/

gcc exploit.c -o exploit -static

find . | cpio -o -H newc | gzip -9 > ../initrd_new.cpio.gz

cd ../

qemu-system-x86_64 \
  -no-reboot \
  -cpu max \
  -net none \
  -serial mon:stdio \
  -display none \
  -monitor none \
  -vga none \
  -s \
  -kernel bzImage \
  -initrd initrd_new.cpio.gz \
  -append "console=ttyS0 nokaslr" \
