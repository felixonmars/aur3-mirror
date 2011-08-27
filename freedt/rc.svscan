#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/bin/svscan`
case "$1" in
	start)
		stat_busy "Starting svscan"
		# create necessary directories if they don't already exist
		mkdir -p /service 2>/dev/null
		[ -z "$PID" ] && /usr/bin/svscan /service &
		if [ $? -gt 0 ]; then
			stat_fail
		else
			add_daemon svscan
			stat_done
		fi
	;;
	stop)
		stat_busy "Stopping svscan"
		[ ! -z "$PID" ]  && kill $PID &> /dev/null
		if [ $? -gt 0 ]; then
			stat_fail
		else
			if [ -e /service/ ]
			then
				stat_busy "Stopping services ..."
				svc -dx /service/*
				stat_done

				stat_busy "Stopping service logging ..."
				svc -dx /service/*/log
				stat_done
			fi

			rm_daemon svscan
			stat_done
		fi
	;;
	restart)
		$0 stop
		[ ! -z "$PID" ] && wait "$PID"
		$0 start
	;;
	*)
		echo "usage: $0 {start|stop|restart}"
esac
exit 0
