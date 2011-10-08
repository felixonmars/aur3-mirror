#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/fakeidentd

PIDFILE="/var/run/fakeidentd.pid"
case "$1" in
	start)
		stat_busy "Starting fake ident daemon"
		if [ ${#IDENTD_USERS[@]} -eq 0 ]; then
			stat_append " - please add users in /etc/conf.d/fakeidentd"
			stat_fail
		else
			/usr/bin/fakeidentd "${IDENTD_USERS[@]}" && stat_done || stat_fail
		fi
	;;
	stop)
		stat_busy "Stopping fake ident daemon"
		kill `cat "$PIDFILE"` 2>/dev/null && stat_done || stat_fail
	;;
	restart)
		$0 stop
		$0 start
	;;
	*)
		echo "usage: $0 {start|stop|restart}"	
esac

