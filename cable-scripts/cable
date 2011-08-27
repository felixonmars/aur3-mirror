#!/bin/sh
#
# /etc/rc.d/cable
#

. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
	start)
		stat_busy "Starting cable script"

		cable-start > /dev/null 2>&1

		if [ $? -gt 0 ]; then
			stat_fail
			cable-stop > /dev/null 2>&1
		else
			sh /etc/rc.d/cable-guard &
			add_daemon cable
			stat_done
		fi
	;;

	stop)
        stat_busy "Stopping cable script"
        kill -9 `ps ax|grep cable-guard|grep -v grep|awk '{print $1;}'` > /dev/null 2>&1
        cable-stop > /dev/null 2>&1
		if [ $? -gt 0 ]; then
			stat_fail
		else
			rm_daemon cable
			stat_done
		fi
	;;

	restart)
		$0 stop
		sleep 2
		$0 start
	;;

	status)
		cable-status
	;;

	setup)
		cable-setup
	;;


	*)
		echo $"Usage: $0 {start|stop|restart|status|setup}"
	;;
esac

