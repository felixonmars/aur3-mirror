#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/bin/scmpc`
case "$1" in
	start)
		stat_busy "Starting scmpc daemon"
		/usr/bin/scmpc -f /etc/scmpc.conf
		if [ $? -gt 0 ]; then
			stat_fail
		else
			stat_done
                       	add_daemon scmpcd
		fi
	;;
	stop)
		stat_busy "Stopping scmpc daemon"
		[ ! -z "$PID" ] && kill $PID &> /dev/null
		if [ $? -gt 0 ]; then
			stat_fail
		else
			stat_done
                       	rm_daemon scmpcd
		fi
	;;
	restart)
		$0 stop
		sleep 1
		$0 start
		;;
	*)
		echo "usage: $0 {start|stop|restart}"
	;;
esac
