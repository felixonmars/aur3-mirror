#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/local/EPKowa/printer/ekpd`

case "$1" in
	start)
		stat_busy "Starting Epson printer deamon"
		[ -z "$PID" ] && /usr/local/EPKowa/printer/ekpd &>/dev/null
		if [ $? -gt 0 ]; then
			stat_fail
		else
			PID=`pidof -o %PPID /usr/local/EPKowa/printer/ekpd`
			echo $PID >/var/run/ekpd.pid
			add_daemon ekpd
			stat_done
		fi
	;;

  stop)
		stat_busy "Stopping Epson printer deamon"
		[ ! -z "$PID" ]  && kill $PID &>/dev/null
		if [ $? -gt 0 ]; then
			stat_fail
		else
			rm_daemon ekpd
			stat_done
		fi
		;;
		
	restart)
		$0 stop
		$0 start
		;;

	*)
		echo "usage: $0 { start | stop | restart }"
		;;
esac
exit 0
