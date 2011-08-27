#!/bin/bash

# general config
. /etc/rc.conf
. /etc/rc.d/functions

. /etc/varnish.conf

PID=`pidof %PPID /usr/sbin/varnishd` 

case "$1" in
    start)
        stat_busy "Starting Varnish Reverse Proxy"
	/usr/sbin/varnishd $OPTS
	if [ $? -gt 0 ]; then
		stat_fail
	else
		add_daemon varnish
		stat_done
	fi
        ;;
    stop)
	stat_busy "Stopping Varnish Reverse Proxy"
	kill $PID &> /dev/null
	if [ $? -gt 0 ]; then
		stat_fail
	else
		rm_daemon varnish
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
