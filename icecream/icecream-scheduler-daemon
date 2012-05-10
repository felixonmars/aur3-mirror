#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/icecream.conf

case "$1" in
	start)
		stat_busy "Starting Icecream Scheduler Daemon"
		netname=
		if test -n "$ICECREAM_NETNAME"; then
		    netname="-n $ICECREAM_NETNAME"
		fi
		logfile=""
		if test -n "$ICECREAM_LOG_FILE"; then
		    touch $ICECREAM_LOG_FILE
		    chown icecream:icecream $ICECREAM_LOG_FILE
		    logfile="-l $ICECREAM_LOG_FILE"
		fi
		/usr/lib/icecream/sbin/scheduler -d $netname $logfile &>/dev/null
		if [ $? -gt 0 ]; then
			stat_fail
		else
			add_daemon icecream-scheduler
			stat_done
		fi
		;;
	stop)
		stat_busy "Stopping Icecream Scheduler Daemon"
		killall /usr/lib/icecream/sbin/scheduler > /dev/null 2>&1 || true
		if [ $? -gt 0 ]; then
			stat_fail
		else
			rm_daemon icecream-scheduler
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
esac
exit 0

