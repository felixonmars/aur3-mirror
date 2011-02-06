#!/bin/bash
if [ "$1" == "" ] ; then
echo "usage: kmake [kernel in /usr/src(without kernel- prefix)] [--justmake, --justconfig]"
fi
k=linux-$1
cd /usr/src
if [ -f /usr/src/linux ] ; then
rm linux
fi
###Check if $k is a kernel
cd $k || echo "Error no $1 found"
cd ..
##
ln -s $k linux
cd linux
#make clean
if [ "$2" != "--justconfig" ] ; then
if [ "$2" != "--justmake" ] ; then
make menuconfig
fi
make || echo "Make failed" 
make modules_install || echo "Module Install failed"
cp arch/i386/boot/bzImage /boot/kernel-$1
echo "Done make && install you new kernel $k at /boot/kernel-$1"
echo "Do you want to edit grub config? <y/n>"
read grub
if [ "$grub" == "y" ] ; then
nano /boot/grub/menu.lst
fi
echo "Done"
exit
fi
make menuconfig
