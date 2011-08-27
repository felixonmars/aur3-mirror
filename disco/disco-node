#!/bin/bash

# general config
. /etc/rc.conf
. /etc/rc.d/functions

. /etc/disco/disco.conf

case "$1" in
    start)
        stat_busy "Starting Disco Node"
        lighttpd -f /etc/disco/lighttpd-node.conf
	if [ $? -gt 0 ]; then
		stat_fail
	else
		add_daemon disco-node
		stat_done
	fi
        ;;
    stop)
	stat_busy "Stopping Disco Node"
	kill $(cat /var/run/disco/disco-lighttpd.pid) &> /dev/null
	if [ $? -gt 0 ]; then
		stat_fail
	else
		rm_daemon disco-node
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
