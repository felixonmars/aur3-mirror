#!/bin/bash

#cmp-daemon 0.21

. /etc/rc.conf
. /etc/rc.d/functions

PROG_NAME=cmp-daemon
PROG_BIN="/usr/sbin/${PROG_NAME}"
PID=`pidof -o %PPID ${PROG_BIN}`

if [ ! -x ${PROG_BIN} ]; then
	echo -n "${PROG_BIN} is not installed "
	exit 5
fi

case "$1" in
	start)
		stat_busy "Starting ${PROG_NAME} "
			if [ -z "$PID" ]; then
				${PROG_BIN}
			fi
			if [ ! -z "$PID" -o $? -gt 0 ]; then
				echo -n "daemon is already running or applesmc not loaded, try:  modprobe applesmc -v "
				stat_fail
			else
				add_daemon ${PROG_NAME}
				stat_done
			fi
			;;
	stop)
		stat_busy "Stopping ${PROG_NAME} "
			[ ! -z "$PID" ] && kill $PID &> /dev/null
			if [ $? -gt 0 ]; then
				stat_fail
			else
				rm_daemon ${PROG_NAME}
				stat_done
			fi
			;;
	restart)
		$0 stop
		sleep 1
		$0 start
		;;
	*)
		echo -n "Usage: $0 {start|stop|restart} "
	;;
esac
