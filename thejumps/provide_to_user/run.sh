#!/bin/bash


##read -p "Enter the link to your exploit binary: " link

##wget $link -O exploit

set -e

gcc fs/exploit.c -o fs/exploit -static
chmod 777 fs/exploit

cd fs/
find . -print0 | cpio --null -ov --format=newc | gzip -9 > ../initramfs.cpio.gz

cd ../


qemu-system-x86_64 \
    -snapshot \
    -kernel bzImage \
    -smp cores=1,threads=1 \
    -initrd initramfs.cpio.gz \
     -append "console=ttyS0 debug earlyprintk=serial oops=panic nokaslr smap smep selinux=0 tsc=unstable net.ifnames=0 panic=1000 cgroup_disable=memory" \
    -net nic \
    -s \
    -nographic \
    -m 128M \
    -monitor none,server,nowait,nodelay,reconnect=-1 \
    -cpu kvm64,+smap,+smep \
     2>&1
