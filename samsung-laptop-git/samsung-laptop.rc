#!/bin/bash
shopt -s nullglob

. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
setup)
	LOG='/var/log/samsung-laptop.log'
	fail () {
		stat_fail
		printhl "Look at $LOG to find out what went wrong"
		exit 1
	}
	stat_busy 'Removing old samsung-laptop modules'
	for i in /lib/modules/*; do
		if [ -f "$i/samsung-laptop.ko" -a ! -f "$i/version" ]; then
			rm -f "$i/samsung-laptop.ko"
			rmdir --ignore-fail-on-non-empty "$i"
		elif [ -f "$i/extra/samsung-laptop.ko" -a ! -d "$i/kernel" ]; then
			rm -f "$i/extra/samsung-laptop.ko"
			rmdir -p --ignore-fail-on-non-empty "$i/extra"
		fi
	done
	stat_done
	stat_busy 'Compiling new samsung-laptop module'
	cd /usr/src/samsung-laptop/
	make &>$LOG && stat_done || fail
	stat_busy 'Installing new samsung-laptop module'
	cp /usr/src/samsung-laptop/drivers/platform/x86/samsung-laptop.ko "/lib/modules/`uname -r`/extramodules/"
	depmod -a
	stat_done
	stat_busy 'Cleaning up'
	make clean &>>$LOG && stat_done || fail
	;;
*)
	echo "usage: $0 setup"
esac
