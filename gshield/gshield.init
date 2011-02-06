#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

# Check that networking is up
if ck_daemon network; then
    echo "Cannot run gshield without network -run network first"
    exit
fi

start() {
	stat_busy "Loading gShield network firewall"
	/usr/share/gshield/gShield.rc start > /dev/null
	# check that it loaded
	iptables -L DMZ > /dev/null 2>&1
	if [ $? -gt 0 ]; then
	    stat_fail
	else
	    stat_done
	fi
}

stop() {
	stat_busy "Unloading gShield network firewall"
	/usr/share/gshield/gShield.rc stop > /dev/null
	# check that it unloaded
	if iptables -L DMZ > /dev/null 2>&1 ; then
		stat_fail
	else
		stat_done
	fi
}

case $1 in
    start)
	start
    ;;
    stop)
	stop
    ;;
    restart)
	stop
	sleep 1
	start
    ;;
    *)
	echo "Usage: gshield {start|stop|restart}"
	exit 1
esac
