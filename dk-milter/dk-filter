#!/bin/bash

# general config
. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/dk-filter.conf

PID=`pidof -o %PPID /usr/sbin/dk-filter`
case "$1" in
    start)
        stat_busy "Starting DK Milter"
        if [ -z "$PID" ]; then
            /usr/sbin/dk-filter $DK_FILTER > /dev/null &
        fi
        if [ ! -z "$PID" -o $? -gt 0 ]; then
            stat_fail
        else
            add_daemon dk-filter
            stat_done
        fi
        ;;
    stop)
        stat_busy "Stopping DK Milter"
        [ ! -z "$PID" ] && kill $PID &> /dev/null
        if [ $? -gt 0 ]; then
            stat_fail
        else
            rm_daemon dk-filter
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
