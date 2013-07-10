#!/bin/sh
if [[ $(id -u) > 0 ]]; then
  echo "Must be run as root."
  exit 1
fi
DRIVER=/usr/lib/xorg/modules/drivers/fglrx_drv.so
for x in $(objdump -d $DRIVER|awk '/call/&&/EnableLogo/{print "\\x"$2"\\x"$3"\\x"$4"\\x"$5"\\x"$6}'); do
  sed -i "s/$x/\x90\x90\x90\x90\x90/g" $DRIVER
done
