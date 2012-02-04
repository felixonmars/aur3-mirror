#!/bin/bash

# general config
. /etc/rc.conf
. /etc/rc.d/functions

. /etc/disco/disco.conf

case "$1" in
    start)
        stat_busy "Starting Disco Master"
	disco-master &>/dev/null &
	if [[ -n "$DISCO_MASTER_PORT" ]]; then
            lighttpd -f /etc/disco/lighttpd-master.conf
        fi
	if [ $? -gt 0 ]; then
		stat_fail
	else
		add_daemon disco-master
		stat_done
	fi
        ;;
    stop)
	stat_busy "Stopping Disco Master"
	if [[ -n "$DISCO_MASTER_PORT" ]]; then
	    kill $(cat /var/run/disco/disco-lighttpd.pid) &> /dev/null
        fi
	kill $(cat /var/run/disco/disco-master.pid) &> /dev/null
	if [ $? -gt 0 ]; then
		stat_fail
	else
		rm_daemon disco-master
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
