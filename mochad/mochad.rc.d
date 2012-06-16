#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

name=mochad
PID=$(pidof -o %PPID /usr/sbin/crond)

case "$1" in
start)
	stat_busy "Starting $name daemon"
	[[ -z "$PID" ]] && /usr/sbin/$name $CRONDARGS &>/dev/null \
	&& { add_daemon $name; stat_done; } \
	|| { stat_fail; exit 1; }
	;;
stop)
	stat_busy "Stopping $name daemon"
	[[ -n "$PID" ]] && kill $PID &>/dev/null \
	&& { rm_daemon $name; stat_done; } \
	|| { stat_fail; exit 1; }
	;;
reload)
	stat_busy "Reloading $name daemon"
	[[ -n "$PID" ]] && kill -HUP $PID &>/dev/null \
	&& { stat_done; } \
	|| { stat_fail; exit 1; }
	;;
restart)
	$0 stop
	sleep 1
	$0 start
	;;
*)
	echo "usage: $0 {start|stop|restart|reload}"
	;;
esac
exit 0
