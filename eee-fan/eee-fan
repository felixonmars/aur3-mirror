#!/bin/bash
# init-script for eee-fan written by slappinjohn on ARCH

. /etc/rc.conf
. /etc/rc.d/functions

DAEMON_NAME=eee-fan
DAEMON_PID=$(pidof -x -o %PPID eee-fan-ctrl.sh)

case "$1" in
	start)
		stat_busy "Starting eee-fan-ctrl"
		[ -z "${DAEMON_PID}" ] && /usr/sbin/eee-fan-ctrl.sh &
		if [ $? -gt 0 ]; then
			stat_fail
			exit 1
		else
			echo $(pidof -x -o %PPID eee-fan-ctrl.sh) > /var/run/eee-fan.pid
		fi
		add_daemon $DAEMON_NAME
		stat_done
;;

	stop)
		stat_busy "Stopping eee-fan-ctrl"
		[ ! -z "${DAEMON_PID}" ] && kill ${DAEMON_PID} &> /dev/null
		if [ $? -gt 0 ]; then
			stat_fail
			exit 1
		else
			rm /var/run/eee-fan.pid &> /dev/null
		fi
		rm_daemon $DAEMON_NAME
		stat_done
;;

	restart)
		$0 stop
		sleep 2
		$0 start
;;

	reload)
		stat_busy "Reloading configuration"
		[ ! -z "${DAEMON_PID}" ] && kill -1 ${DAEMON_PID} &> /dev/null
		if [ $? -gt 0 ]; then
			stat_fail
			exit 1
		fi
		stat_done	
;;

	*)
		echo "usage: $0 {start|stop|restart|reload}"
;;
esac
exit 0

