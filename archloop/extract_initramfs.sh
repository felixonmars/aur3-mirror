#!/bin/bash


INITRAMFS_DIR="initramfs_cpio_dir"
#INITRAMFS_FILE="$(pwd)/x86_64_iso_rootfs/boot/initramfs-linux-fallback.img"
INITRAMFS_FILE="/tmp/iso/boot/initramfs-linux-fallback.img"
CPIO_FILE="initramfs.cpio.gz"

if [ ! -d ${INITRAMFS_DIR} ] ; then
    mkdir -pv ${INITRAMFS_DIR}
fi
cd ${INITRAMFS_DIR}
if [ -e $CPIO_FILE ] ; then
    rm -f $CPIO_FILE
fi
cp  -f $INITRAMFS_FILE  $CPIO_FILE
gzip -f -d $CPIO_FILE
sudo cpio -idmv --no-absolute-filenames < ${CPIO_FILE/.gz}

