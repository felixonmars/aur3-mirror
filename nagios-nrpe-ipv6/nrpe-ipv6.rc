#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

start() {
	stat_busy "Starting NRPE"
	PID=`pidof -o %PPID /usr/sbin/nrpe`
	[ -z "$PID" ] && /usr/sbin/nrpe -c /etc/nrpe.cfg -d
	if [ $? -gt 0 ]; then
		stat_fail
	else
		add_daemon nrpe
	stat_done
	fi
}

stop() {
	stat_busy "Stopping NRPE"
	PID=`pidof -o %PPID /usr/sbin/nrpe`
	[ ! -z "$PID" ]  && kill $PID &> /dev/null
	if [ $? -gt 0 ]; then
	    stat_fail
	else
		rm_daemon nrpe
		stat_done
	fi
}

case "$1" in
	start)
		start
	;;
	stop)
		stop
	;;
	restart)
		stop
		start
	;;
	*)
		echo "usage: $0 {start|stop|restart}"  
	esac
exit 0
