#!/bin/sh 

. /etc/rc.conf
. /etc/rc.d/functions

PID=$(pidof -o %PPID /usr/sbin/granola)

case "$1" in
	start)
		stat_busy "Starting Granola"
		if [[ -z $PID ]] && /usr/sbin/granola -D; then
			echo "$PID" > /var/run/granola.pid
			add_daemon granola
			stat_done
		else
			stat_fail
		fi
        ;;
	stop)
		stat_busy "Stopping Granola"
		if [[ ! -z $PID ]]  && kill "$PID" &>/dev/null; then
			rm_daemon granola
			stat_done
		else
			stat_fail
			exit 1
		fi
        ;;
	status)
		pidof granola 1>/dev/null && echo "granola is running" && exit 0|| echo "granola is not running" && exit 1
        ;;

	restart)
		$0 stop
		sleep 1
		$0 start
        ;;
	*)
		echo "Usage: $0 {start|stop|status|restart}"
		exit 1
        ;;
esac
