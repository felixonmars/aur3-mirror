#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
	start)
		/usr/sbin/cryptcfg --menu
		error=$?

		if [ $error -eq 0 ]; then
			stat_done
		else
			stat_fail
		fi
		;;
	stop)
		stat_busy "Closing All Crypt Volumes"
		/usr/sbin/cryptcfg --stopall
		error=$?

		if [ $error -eq 0 ]; then
			stat_done
		else
			stat_fail
		fi
		;;
	restart)
		$0 stop
		/bin/sleep 2
		$0 start
		;;
	*)
		echo "usage: $0 {start|stop|restart}"  
esac
