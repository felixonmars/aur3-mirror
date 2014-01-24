#!/bin/bash
size=$(/usr/bin/free -o -h | /usr/bin/grep Mem | /usr/bin/awk '{print $2}')K
swapfile=/var/swap
source /etc/systemd-loop-swapfile.conf

start(){
	loopdev=$(/usr/bin/losetup -f) && echo find loop device
	/usr/bin/truncate -s $size $swapfile && echo swap file created
	/usr/bin/chattr +C $swapfile
	/usr/bin/losetup $loopdev $swapfile && echo mount swap file via loop device
	/usr/bin/mkswap -L swapfile $loopdev && echo create swap space on loop device
	/usr/bin/swapon $loopdev && echo mount swap loop device
}

stop(){
	/usr/bin/losetup -d $(losetup | /usr/bin/grep $swapfile | /usr/bin/awk '{print $1}')
	/usr/bin/swapoff -a && echo deatach all swaps
	/usr/bin/rm $swapfile && echo remove all swap file
}

case $1 in
	start|stop) $1 ;;
esac