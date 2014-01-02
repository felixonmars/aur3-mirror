#!/bin/bash
size=1G
swapfile=/var/swap
export /etc/loop-swapfile.conf
# loopdev=$(losetup -f) - automatical find free loop device
# [ ! -f $swapfile ] - help for avoid recreate swap file
# truncate -s $size $swapfile - create swapfile manualy, if he not exist
# chattr -C $swapfile - can do some speed up on HDD, because file flaged 
# no CoW, not fragmentated on disk. This option safety for use on only empty files.
loopdev=$(losetup -f)
truncate -s $size $swapfile && chattr +C $swapfile
losetup $loopdev $swapfile
mkswap $loopdev
swapon $loopdev && echo $loopdev > /tmp/swaploopdev