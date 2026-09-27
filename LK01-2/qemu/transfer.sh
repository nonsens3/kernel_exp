#! /bin/sh
gcc exploit.c -o exploit -static
mv exploit root/
cd root; find . -print0 | cpio -o --null --format=newc --owner=root > ../debugfs.cpio
cd ../

qemu-system-x86_64 \
    -m 64M \
    -nographic \
    -kernel bzImage \
    -append "console=ttyS0 loglevel=3 oops=panic panic=-1 pti=on" \
    -no-reboot \
    -cpu kvm64,+smep,+smap  \
    -s \
    -S \
    -smp 1 \
    -monitor /dev/null \
    -initrd debugfs.cpio \
    -net nic,model=virtio \
    -net user
