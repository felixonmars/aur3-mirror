#!/bin/bash

build() {  
    MODULES=" $(checked_modules "/usb/host" | grep -ve "_cs" -e "sl811-hcd" -e "isp116x-hcd")"  
  
    MODULES=$(echo ${MODULES}) #trim whitespace  
    if [ -n "${MODULES}" ]; then  
        MODULES="${MODULES} usb_storage sd_mod sr_mod"  
        MODULES="${MODULES} $(checked_modules "drivers/usb/storage/ums-*")"  
    fi  
    MODULES="${MODULES} nls_utf8" #cp936
    BINARIES="blkid mount.ntfs-3g tr"  
    FILES=""  
    #for rules in 61-persistent-cdrom.rules ; do
        #add_file "/usr/lib/udev/rules.d/$rules"
    #done

    SCRIPT="automount"  
}  
  
help()  
{  
    echo "
  This hook auto mount the root device base on cmdline.  
  Can support:  
    1. Boot from normal harddisk or USB disk;  
    2. Boot from CD-ROM or DVD-ROM;  
    3. Boot from loop device file (made by dd or other tools);  
    4. Boot from squashfs files;  
   ..."
}  
