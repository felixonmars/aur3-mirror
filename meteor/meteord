#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/sbin/meteord`

case "$1" in
	start)
    stat_busy "Starting meteord"
		if [ ! -z "$PID" ]; then
			stat_fail
		else
			echo 65535 > /proc/sys/fs/file-max
			ulimit -n 65535
			sudo -u meteor /usr/sbin/meteord >/var/log/meteord 2>&1
			if [ $? -gt 0 ]; then
				stat_fail
			else
				add_daemon meteor
				stat_done
			fi
		fi
		;;
	stop)
		stat_busy "Stopping meteord"
		if [ -z "$PID" ]; then
			stat_fail
		else
			kill $PID &>/dev/null
			if [ $? -gt 0 ]; then
				stat_fail
			else
				rm_daemon meteor
				stat_done
			fi
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

