cd artifacts/
./builder.sh
cd ..

cd "$(dirname "$0")"
exec qemu-system-x86_64 \
    -kernel "./artifacts/bzImage" \
    -initrd "./artifacts/rootfs_updated.cpio.gz" \
    -append "oops=panic panic=1 console=ttyS0 nokaslr quiet" \
    -nographic \
    -serial stdio \
    -monitor none \
    -nic user,model=virtio-net-pci \
    -no-reboot \
    -snapshot \
    -m 64M \
    -s \
    -cpu max,+smap,+smep,enforce \
    -drive id=flag,file="./flag.txt",format=raw,if=virtio
