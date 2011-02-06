#!/bin/bash
#
# Install Script for the OMNIKEY Cardman USB Smartcard reader series.
#

rel=`uname -r`
min=`uname -r | cut -f2 -d.`

moddir=${pkgdir}/lib/modules
driver_file=""

echo
echo Installing OMNIKEY Cardman USB Smartcard reader...
echo
#
# setup logfile
#
logfile=install.log
if [ -f $logfile ]; then
  rm -f $logfile
  touch logfile
fi
#
# check if running as root
#
#if [ `id -u` -ne 0 ]; then
#  echo You have to run the driver installation as root.
#  exit
#fi

#
# detect pcsc-driver dir
#
pcsc_driverdir=${pkgdir}/usr/lib/pcsc/drivers/

#
# copy the pcsc-shared library to its proper place
#
echo $pcsc_driverdir
mkdir -p $pcsc_driverdir &> /dev/null
cp -r ifd-cm2020.bundle $pcsc_driverdir


#
# check if module for this Kernel version exists
#

cd ./src/cm2020
if [ $min -le 4 ]; then
  kext=o
  cp ./makefile.24 ./makefile
else
  kext=ko
  cp ./makefile.26 ./Makefile
fi
if [ ! -f ../../modules/cardman.$rel.$kext ]; then
  echo "The kernel module for $rel isn't prebuilt!"
  echo "Try to compile it for you!"
  make clean 2> /dev/null
  make 2> /dev/null
  if [ ! -f ./cardman.$kext ]; then
    echo "Couldn't build kernel module."
    echo "Compile it by yourself or" 
    echo "contact OMNIKEY for further details."
    echo "(e-mail: support.linux@omnikey.com)"
    exit 1
  else
    mv ./cardman.$kext ../../modules/cardman.$rel.$kext
    /sbin/depmod -ae
  fi
fi
cd ../../

#
# copy cardman kernel module
#

if [ $min == 2 ]; then
  mod_min=misc
elif [ $min == 4 ]; then
  mod_min=kernel/drivers/usb
elif [ $min -ge 5 ]; then
  mod_min=kernel/drivers/usb/misc
fi
if [ ! -d $moddir/$rel/$mod_min ]; then
    mkdir $moddir/$rel/$mod_min 2> /dev/null
fi

driver_file="$moddir/$rel/$mod_min/cardman.$kext"
echo Copy cardman.$kext to $moddir/$rel/$mod_min
mkdir -p `dirname $driver_file`
cp ./modules/cardman.$rel.$kext $driver_file 
chmod 644 $driver_file 
if [ $? == 1 ]; then
  echo Could not copy cardman-module, exiting
  exit 0
fi

mkdir -p ${pkgdir}/etc/udev/rules.d/
cp 10-cardmanusb.rules ${pkgdir}/etc/udev/rules.d/10-cardmanusb.rules

#
# Finally, load the kernel module
#
#echo Attempting to start the cardman kernel module
#/sbin/rmmod cardman 2>/dev/null

#/sbin/insmod $driver_file 2>/dev/null

#echo
echo Installation finished
