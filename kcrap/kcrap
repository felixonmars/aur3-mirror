#!/bin/bash

# general config
. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/sbin/kcrap_server`
case "$1" in
    start)
        stat_busy "Starting Kerberos Challenge-Response Authentication Protocol server (KCRAP)"
        if [ -z "$PID" ]; then
           /usr/sbin/kcrap_server
        fi
        if [ ! -z "$PID" -o $? -gt 0 ]; then
            stat_fail
        else
            add_daemon kcrap
            stat_done
        fi
        ;;
    stop)
        stat_busy "Stopping Kerberos Challenge-Response Authentication Protocol server (KCRAP)"
	    [ ! -z "$PID" ] && kill $PID &> /dev/null
        if [ $? -gt 0 ]; then
            stat_fail
        else
            rm_daemon kcrap
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
