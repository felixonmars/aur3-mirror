#!/bin/bash

# general config
. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /sbin/muhttpd`
case "$1" in
	start)
	stat_busy "Starting muhttpd web server"
	[ -z "$PID" ] && /sbin/muhttpd
	if [ $? -gt 0 ]; then
		stat_fail
	else
		add_daemon muhttpd
		stat_done
	fi
	;;
	stop)
	stat_busy "Stopping muhttpd web server"
	#[ -f /var/run/muhttpd.pid ] && kill `cat /var/run/muhttpd.pid` >/dev/null 2>&1
	[ ! -z "$PID" ] && kill $PID &>/dev/null
	if [ $? -gt 0 ]; then
		stat_fail
	else
		rm_daemon muhttpd
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
	;;
esac
exit 0
