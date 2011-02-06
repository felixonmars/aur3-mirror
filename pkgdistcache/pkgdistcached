#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pgrep -f '/usr/bin/python /usr/bin/pkgdistcache-daemon'`
case "$1" in
	start)
		stat_busy "Starting pkgdistcache daemon"
		[ -z "$PID" ] && /usr/bin/pkgdistcache-daemon
		if [ $? -gt 0 ]; then
			stat_fail
		else
			add_daemon pkgdistcached
			stat_done
		fi
		;;
	stop)
		stat_busy "Stopping pkgdistcache daemon"
		if [ ! -z "$PID" ]; then
			kill $PID &> /dev/null
			if [ $? -gt 0 ]; then
				stat_fail
			else
				rm_daemon pkgdistcached
				stat_done
			fi
		else
			stat_fail
		fi
		;;
	restart)
		$0 stop
		sleep 1
		$0 start
		;;
	*)
		echo "usage: $0 {start|stop|restart}"
esac
exit 0
