For install grub4dos or upgrade it.

Assume / is in grub4dos support filesystem. (ext2, ext3, ext4, ntfs, fat, fat32)
Assume /dev/sda is your boot disk.
Assume /dev/sdd is your bootable usb stick.

STEP 1
------
# install first stage boot loader to MBR of /dev/sda
bootlace.com --no-backup-mbr --mbr-disable-floppy --time-out=0 /dev/sda

# if you want to backup previous MBR, use the following command instead
# press 'space' on boot screen to change to previous MBR
bootlace.com --mbr-disable-floppy /dev/sda

# if you want to test before destroy your MBR, use usb stick to boot
bootlace.com --no-backup-mbr --mbr-disable-floppy --time-out=0 /dev/sdd

STEP 2
------
cp /usr/share/grub4dos/grldr /  # put second stage loader 

STEP 3
------
cp /usr/share/grub4dos/menu.lst / # copy default menu, edit it 

Read document which come from this package in /usr/share/doc/grub4dos.
After install, you can remove this package.

Ref: Best grub4dos manual http://diddy.boot-land.net/grub4dos/Grub4dos.htm

STEP 4 (optional)
-----------------
if you want to use 'default' option in menu.lst
cp /usr/share/grub4dos/default / # install 'default' special file

STEP 5 (optional)
-----------------
if you want to use window's boot.ini bootmgr.ini to chain grub4dos
cp /usr/share/grub4dos/grub.exe / # install 'default' special file

STEP 5 (optional)
-----------------
For unicode menu read http://chenall.net/2010/03/grub4dos_unifont/ .
