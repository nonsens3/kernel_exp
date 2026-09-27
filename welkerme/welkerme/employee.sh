#!/bin/bash

set -e

case "$1" in
    "compress")
        musl-gcc -static exploit.c -o vm/system/exploit
        cd vm/system
        find . -print0 | cpio -o --format=newc --null --owner=root > ../rootfs_updated.cpio
        echo "Archivo generado: $(pwd)/rootfs_updated.cpio"
        ;;

    "decompress")
        cpio -idv < vm/rootfs_updated.cpio
        ;;

    *)
        echo "Uso: $0 {compress|decompress}"
        exit 1
        ;;
esac
