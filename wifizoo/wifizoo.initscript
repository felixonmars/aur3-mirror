#!/bin/bash

WIFIZOO_ARGS=
[ -f /etc/conf.d/wifizoo ] && . /etc/conf.d/wifizoo

. /etc/rc.conf
. /etc/rc.d/functions

PID=`ps -eo pid,cmd | grep wifizoo.py | grep -v grep | awk {'print $1;'}`
case "$1" in
	start)
		stat_busy "Starting Wifizoo"
		if [ -z "${PID}" ]; then
			cd /opt/wifizoo
			python2 wifizoo.py ${WIFIZOO_ARGS} &> /dev/null &
		fi
		if [ ! -z "$PID" -o $? -gt 0 ]; then
			stat_fail
		else
			add_daemon wifizoo
			stat_done
		fi
		;;
	stop)
		stat_busy "Stopping Wifizoo"
			[ ! -z "${PID}" ] && kill ${PID} &> /dev/null
		if [ $? -gt 0 ]; then
			stat_fail
		else
			rm_daemon wifizoo
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
