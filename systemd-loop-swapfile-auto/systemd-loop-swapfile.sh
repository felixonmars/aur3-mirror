#!/bin/bash
size=$(/usr/bin/free -o | /usr/bin/grep Mem | /usr/bin/awk '{print $2}')
swapfile=/var/swap
source /etc/systemd-loop-swapfile.conf
# loopdev=$(losetup -f) - automatical find free loop device
# [ ! -f $swapfile ] - help for avoid recreate swap file
# truncate -s $size $swapfile - create swapfile manualy, if he not exist
# chattr -C $swapfile - can do some speed up on HDD, because file flaged 
# no CoW, not fragmentated on disk. This option safety for use on only empty files.

start_swapfile() {
	loopdev=$(/usr/bin/losetup -f)
	/usr/bin/truncate -s $size $swapfile
	/usr/bin/chattr +C $swapfile
	/usr/bin/losetup $loopdev $swapfile
	/usr/bin/mkswap $loopdev
	/usr/bin/swapon $loopdev
}

swap_devs=($(/usr/bin/swapon | /usr/bin/grep dev | /usr/bin/awk '{print $1}'))
stop_swapfile() {
	for i in $swap_devs
		do
			/usr/bit/swapoff $i
			/usr/bin/losetup -d $i
		done
}
[[ "$1"=="on" ]]  && start_swapfile
[[ "$1"=="off" ]] && stop_swapfile