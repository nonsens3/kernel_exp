#!/bin/bash

set -e

cd system
sudo musl-gcc -static /home/glenn/job/kernel/throughthewall/system/home/ctf/exploit.c -o /home/glenn/job/kernel/throughthewall/system/home/ctf/exploit
sudo find . -print0 | sudo cpio --null -ov --format=newc --owner=root | sudo gzip -9 > ../initramfs-new.cpio.gz

cd ..

ls

sudo bash start.sh
