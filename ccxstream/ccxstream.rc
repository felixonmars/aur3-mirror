#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
[ -f /etc/conf.d/ccxstream ] && . /etc/conf.d/ccxstream
[ -z "$RUNASUSER" ] && echo "Please set media server username";exit -1;
[ ! "$CHECK" = "YES" ] && echo "Please setup /etc/conf.d/ccxstream before starting ccXstream";exit -1;

PID=`pidof -o %PPID ccxstream`
case "$1" in
	start)
		stat_busy "Starting ccXstream (XBMSP) Daemon"
		[ -z "$PID" ] && su $RUNASUSER -c $BIN $PARAMS 2>&- >&-
		if [ $? -gt 0 ]; then
			stat_fail
		else
			PID=`pidof -o %PPID ccxstream`
			echo $PID > /var/run/ccxstream.pid
			add_daemon ccxstream
			stat_done
		fi

	;;
	stop)
		stat_busy "Stopping ccXstream"
		[ ! -z "$PID" ] && kill $PID >&-
		if [ $? -gt 0 ]; then
			stat_fail
		else
			rm /var/run/ccxstream.pid
			rm_daemon ccxstream
			stat_done
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

