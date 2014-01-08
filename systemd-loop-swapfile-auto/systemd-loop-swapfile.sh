#!/bin/bash
size=$(/usr/bin/free -o -h | /usr/bin/grep Mem | /usr/bin/awk '{print $2}')K
swapfile=/var/swap
source /etc/systemd-loop-swapfile.conf

start_swapfile(){
	loopdev=$(/usr/bin/losetup -f)
	/usr/bin/truncate -s $size $swapfile
	/usr/bin/chattr +C $swapfile
	/usr/bin/losetup $loopdev $swapfile
	/usr/bin/mkswap $loopdev
	/usr/bin/swapon $loopdev
}

stop_swapfile(){
	swap_devs=( $(/usr/bin/swapon | /usr/bin/grep dev | /usr/bin/awk '{print $1}') )
	/usr/bit/swapoff $swap_devs
	/usr/bin/losetup -d $swap_devs
	/usr/bin/rm $swapfile
}
[[ "$1"=="on" ]] && start_swapfile
[[ "$1"=="off" ]] && stop_swapfile