#!/bin/bash

# general config
. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /opt/heimdal/sbin/kpasswdd`
case "$1" in
    start)
        stat_busy "Starting Heimdal KDC"
        if [ -z "$PID" ]; then
           /opt/heimdal/sbin/kpasswdd &
        fi
        if [ ! -z "$PID" -o $? -gt 0 ]; then
            stat_fail
        else
            add_daemon heimdal-kpasswdd
            stat_done
        fi
        ;;
    stop)
        stat_busy "Stopping Heimdal KDC"
	    [ ! -z "$PID" ] && kill $PID &> /dev/null
        if [ $? -gt 0 ]; then
            stat_fail
        else
            rm_daemon heimdal-kpasswdd
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
