#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

N=mentohust

case "$1" in
	start)
		if ! ck_daemon $N; then
			echo "mentoHUST is already running.  Try '/etc/rc.d/$N restart'"
			exit
		fi
		stat_busy "Starting mentoHUST"
		if [ -z `pidof $N` ]; then
			$N >& /dev/null &
		fi
		add_daemon $N
		stat_done
		;;
	stop)
		stat_busy "Stopping mentoHUST"
		$N -k >& /dev/null
		dhcpcd eth0 -k
		rm_daemon $N
		stat_done
		;;
	restart)
		$0 stop
		$0 start
		;;
	*)
		echo "usage: $0 {start|stop|restart}"  
esac
