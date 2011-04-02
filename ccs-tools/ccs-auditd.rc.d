#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=$(pidof -o %PPID /usr/sbin/ccs-auditd)
case "$1" in
    start)
        stat_busy "Starting ccs-auditd"
        [ -z "$PID" ] && /usr/sbin/ccs-auditd
        if [ $? -ne 0 ]; then
            stat_fail
        else
            add_daemon ccs-auditd
            stat_done
        fi
        ;;
    stop)
        stat_busy "Stopping ccs-auditd"
        [ ! -z "$PID" ] && kill "$PID" &> /dev/null
        if [ $? -ne 0 ]; then
            stat_fail
        else
            rm_daemon ccs-auditd
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
