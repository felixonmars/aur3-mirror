#!/bin/sh

. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
start)
	stat_busy "Checking boot partition digest"
	if boot-digest-check; then
		stat_done
	else
		stat_fail
		echo "Digest-check on /boot has FAILED!!!"
		echo "Someone might have tampered with your boot files!"
		stat_fail
	fi
	;;
stop)
	;;
*)
	echo "Usage: $0 {start|stop}"
esac
