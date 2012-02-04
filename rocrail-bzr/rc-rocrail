#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=$(pidof -o %PPID /opt/rocrail/rocrail)

case $1 in
start)
	stat_busy "Starting Rocrail Daemon"
	if [[ -z $PID ]] && /opt/rocrail/rocraild.sh &>/dev/null; then
		PID=$(pidof -o %PPID /opt/rocrail/rocrail)
		echo "$PID" > /var/run/rocrail.pid
		add_daemon rocrail
		stat_done
	else
		stat_fail
		exit 1
	fi
	;;

stop)
	stat_busy "Stopping Rocrail Daemon"
	if [[ ! -z $PID ]]  && kill "$PID" &>/dev/null; then
		rm_daemon rocrail
		stat_done
	else
		stat_fail
		exit 1
	fi
	;;

restart)
	$0 stop
	sleep 1
	$0 start
	;;

*)
	echo "Usage: $0 {start|stop|restart}" >&2
	exit 1

esac
