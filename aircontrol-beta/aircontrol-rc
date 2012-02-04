#!/bin/bash

# general config
. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
    start)
        #Check for running dbus, start when not running
    	ck_daemon dbus && /etc/rc.d/dbus start
        stat_busy "Starting Aircontrol"
	cd /opt/aircontrol/bin && sh startup.sh
	if [ $? -gt 0 ]; then
		stat_fail
	else
		add_daemon aircontrol
		stat_done
	fi
        ;;
    stop)
	stat_busy "Stopping Aircontrol"
	cd /opt/aircontrol/bin && sh shutdown.sh
	if [ $? -gt 0 ]; then
		stat_fail
	else
		rm_daemon aircontrol
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
