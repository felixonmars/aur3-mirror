ChangeLog is on http://code.google.com/p/grub4dos-chenall/source/list

=======
INSTALL
=======

Simple Method
=============
1. edit /etc/grub4dos.conf
    set the auto_upgrade=1
    review the options
2. upgrade this package again
3. edit /grub/menu.lst

Complex Manual Method
=====================
Assume / is in grub4dos support filesystem. (ext2, ext3, ext4, ntfs, fat, fat32)
Assume /dev/sda is your boot disk.
Assume /dev/sdd is your bootable usb stick.
Assume /mnt/sda1 is your boot partition mount point


STEP 1
------
# NOTE: use bootlace64.com instead of bootlace.com in x86_64 system

# install first stage boot loader to MBR of /dev/sda
bootlace.com --no-backup-mbr --mbr-disable-floppy --time-out=0 /dev/sda

# if you want to backup previous MBR, use the following command instead
# press 'space' on boot screen to change to previous MBR
bootlace.com --mbr-disable-floppy /dev/sda

# if you want to test before destroy your MBR, use usb stick to boot
bootlace.com --no-backup-mbr --mbr-disable-floppy --time-out=0 /dev/sdd

STEP 2
------
cp /grub/share/grub4dos/grldr /mnt/sda1  # put second stage loader

STEP 3
------
mkdir -p /mnt/sda1/grub
cp /grub/menu.lst /mnt/sda1/grub # copy default menu, edit it

Read document which come from this package in /usr/share/doc/grub4dos.
After install, you can remove this package.

Ref: Best grub4dos manual http://diddy.boot-land.net/grub4dos/Grub4dos.htm

STEP 4 (optional)
-----------------
if you want to use 'default' option in menu.lst
cp /grub/default /mnt/sda1/grub # install 'default' special file

STEP 5 (optional)
-----------------
if you want to use window's boot.ini bootmgr.ini to chain grub4dos
cp /grub/grub.exe /mnt/sda1/grub
