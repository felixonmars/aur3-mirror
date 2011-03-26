#!/bin/bash

# general config
. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/dkim-filter.conf

PID=`pidof -o %PPID /usr/sbin/dkim-filter`
case "$1" in
    start)
        stat_busy "Starting DKIM Filter"
        if [ -z "$PID" ]; then
            /usr/sbin/dkim-filter $DKIM_FILTER > /dev/null &
        fi
        if [ ! -z "$PID" -o $? -gt 0 ]; then
            stat_fail
        else
            add_daemon dkim
            stat_done
        fi
        ;;
    stop)
        stat_busy "Stopping DKIM Filter"
        [ ! -z "$PID" ] && kill $PID &> /dev/null
        if [ $? -gt 0 ]; then
            stat_fail
        else
            rm_daemon dkim
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
