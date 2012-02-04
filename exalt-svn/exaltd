#!/bin/bash

# general config
. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
    start)
        #Check for running dbus, start when not running
    	ck_daemon dbus && /etc/rc.d/dbus start
        stat_busy "Starting Exalt Connection Manager"
	/usr/sbin/exalt-daemon
	if [ $? -gt 0 ]; then
		stat_fail
	else
		add_daemon exaltd
		stat_done
	fi
        ;;
    stop)
	stat_busy "Stopping Exalt Connection Manager"
	killall exalt-daemon
	if [ $? -gt 0 ]; then
		stat_fail
	else
		rm_daemon hal
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
