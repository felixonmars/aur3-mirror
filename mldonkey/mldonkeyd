#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/mldonkey

getPID() {
    pidof -o %PPID mlnet
}

case "$1" in
    start)
	stat_busy "Starting MLDonkey"
	install -d -m755 -o mldonkey -g mldonkey /run/mldonkey

	[ -z $PID ] && su mldonkey -s /bin/sh -c "/usr/bin/mlnet -pid /run/mldonkey $PARAMS -log_to_syslog true &> /tmp/mldonkey.log &"
	if [ $? -gt 0 ]; then
	    stat_fail
	else
	    add_daemon mldonkey
	    stat_done
	fi
	;;

    stop)
	stat_busy "Stopping MLDonkey"
	if [ ! -z "$(getPID)" ]; then
	    timeo=30
	    kill $(getPID) &> /dev/null
	    if [ $? -gt 0 ]; then
		stat_fail
		exit 1
	    fi
	    while [ ! -z "$(getPID)" -a $timeo -gt 0 ]; do
		sleep 1
		let timeo=${timeo}-1
	    done
	    if [ -z "$(getPID)" ]; then
		rm -f /run/mldonkey/mlnet.pid &>/dev/null
		rm_daemon mldonkey
		stat_done
	    else
		stat_fail
		exit 1
	    fi
	else
	    stat_fail
	    exit 1
	fi
	;;

    restart)
	$0 stop
	$0 start
	;;

    *)
	echo "usage: $0 {start|stop|restart}"
esac
exit 0
