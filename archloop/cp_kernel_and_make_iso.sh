#!/bin/bash

MAKE_GRUB2_ISO_SH="/home/arch/MultiConfigDir/script/make_grub2_iso.sh"
EXTRACT_CPIO_SCRIPT="extract_initramfs.sh"
ROOTFS_DIR="x86_64_iso_rootfs"
DEST_ISO_DIR="x86_64_iso_dir"
CP_GROGRAM=$(type -P cp)

ROOTFS_SCRIPTS_DIR="${ROOTFS_DIR}/scripts/"

if [ ! -e ${MAKE_GRUB2_ISO_SH} ] ;then
    echo "${MAKE_GRUB2_ISO_SH} no found"
    exit 1
fi

if [ ! -d ${DEST_ISO_DIR} ] ;then
    echo "${DEST_ISO_DIR} no found"
    exit 1
fi

if [ ! -d ${ROOTFS_DIR} ] ;then
    echo "${ROOTFS_DIR} no found"
    exit 1
fi

#echo sudo ${CP_GROGRAM} -af ${ROOTFS_DIR}/boot  ${DEST_ISO_DIR}
if [ ! -e ${DEST_ISO_DIR}/boot/grub ] ; then
    mkdir -pv ${DEST_ISO_DIR}/boot/grub
fi
sudo ${CP_GROGRAM} -af ${ROOTFS_DIR}/boot/grub/grub.cfg  ${DEST_ISO_DIR}/boot/grub/grub.cfg
sudo ${CP_GROGRAM} -af ${ROOTFS_DIR}/boot/initramfs-linux*  ${DEST_ISO_DIR}/boot/
#sudo ${CP_GROGRAM} -af ${ROOTFS_DIR}/boot/vmlinuz-linux   ${DEST_ISO_DIR}/boot/
sudo ${CP_GROGRAM} $0 ${DEST_ISO_DIR}/
sudo ${CP_GROGRAM} ${EXTRACT_CPIO_SCRIPT} ${DEST_ISO_DIR}/

if [ ! -d  ${ROOTFS_SCRIPTS_DIR} ] ; then
    mkdir -pv ${ROOTFS_SCRIPTS_DIR}
fi
sudo ${CP_GROGRAM} $0 ${ROOTFS_SCRIPTS_DIR}

sudo ${CP_GROGRAM} ${MAKE_GRUB2_ISO_SH} ${ROOTFS_SCRIPTS_DIR}
sudo ${CP_GROGRAM} ${EXTRACT_CPIO_SCRIPT} ${ROOTFS_SCRIPTS_DIR}


echo sudo ${MAKE_GRUB2_ISO_SH} ${DEST_ISO_DIR}
sudo ${MAKE_GRUB2_ISO_SH} ${DEST_ISO_DIR}


echo "read me
grub.cfg 的引导方式，注意 root 设置为 iso 光盘，而非squashfs中的boot/initramfs

menuentry "Archlinux in loop x86_64 \(livecd auto search\)" {  
    insmod part_msdos  
    insmod reiserfs  
    insmod loopback  
    insmod udf  
  
    #set img_label=winxp    #固定label时使用,此处屏蔽  
    set img_file=x86_64.sf  
    search --file --no-floppy --set=img_root /\$img_file     #搜索指定文件  
    #search --label --no-floppy --set=img_root \$img_label   #固定label方式  
    #loopback loop0 (hd0,msdos9)/\$img_file  
    probe \$img_root -l --set=img_label          #探测label ,目标label 不能有中文等无法识别的字符  
    #probe \$img_root -u --set=img_root_uuid     #探测uuid 但测试发现因为大小写问题导致linux的by-uuid值不匹配  
    #loopback loop0 (\$img_root)/\$img_file  
    #set root=(loop0)  
    set root=(\$img_root)
    linux /boot/vmlinuz-linux real_root=loop=/dev/disk/by-label/\$img_label loopfile=\$img_file  init=/bin/systemd rootwait isolabel=yes fsck.mode=skip
    #linux /boot/vmlinuz26 real_root=loop=/dev/disk/by-uuid/\$img_root_uuid loopfile=\$img_file  quiet   
    initrd /boot/initramfs-linux-fallback.img
}

"
