#!/bin/bash

# source application-specific settings
[ -f /etc/conf.d/slon ] && . /etc/conf.d/slon

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/bin/slon`

case "$1" in
    start)
	stat_busy "Starting Slony-I Replication daemon"
	[ -z "$PID" ] && /usr/bin/slon_start --config /etc/slon_tools.conf $NODE_NAME
	if [ $? -gt 0 ]; then
	    stat_fail
	else
	    add_daemon slon
	    stat_done
	fi
    ;;
    stop)
	stat_busy "Stopping Slony-I Replication daemon"
	[ ! -z "$PID" ] && /usr/bin/slon_kill --config /etc/slon_tools.conf
	if [ $? -gt 0 ]; then
	    stat_fail
	else
	    rm_daemon slon
	    stat_done
	fi
    ;;
    restart)
	$0 stop
	sleep 1
	$0 start
    ;;
    *)
        echo "usage: $0 {start|stop|restart}"
        ;;
esac

exit 0
