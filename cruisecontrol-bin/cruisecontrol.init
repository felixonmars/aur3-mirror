#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PIDFILE="/var/run/cruisecontrol.pid"
PID=`cat $PIDFILE 2>/dev/null`

case "$1" in
	start)
		stat_busy "Starting CruiseControl"

		cd /opt/cruisecontrol/ && su cruisecontrol -c '/opt/cruisecontrol/cruisecontrol.sh &>/var/log/cruisecontrol.log'

		PID=`cat $PIDFILE 2>/dev/null`
		ps -p $PID &>/dev/null

		if [ -z "$PID" -o $? -gt 0 ]; then
			stat_fail
		else
			add_daemon cruisecontrol
			stat_done
		fi
	;;
	stop)
		stat_busy "Stopping CruiseControl"

		[ ! -z "$PID" ] && kill $PID &>/dev/null

		if [ $? -gt 0 ]; then
			stat_fail
		else
			rm_daemon cruisecontrol
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
