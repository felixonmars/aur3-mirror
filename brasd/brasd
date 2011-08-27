#!/bin/bash

# general config
. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/sbin/brasd`
case "$1" in
    start)
        stat_busy "Starting brasd"
        if [ -z "$PID" ]; then
		/usr/sbin/brasd &
        fi
        if [ ! -z "$PID" -o $? -gt 0 ]; then
            stat_fail
        else
            add_daemon brasd
            stat_done
        fi
        ;;
    stop)
        stat_busy "Stopping brasd"
	    [ ! -z "$PID" ] && kill $PID &> /dev/null
        if [ $? -gt 0 ]; then
            stat_fail
        else
            rm_daemon brasd
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
