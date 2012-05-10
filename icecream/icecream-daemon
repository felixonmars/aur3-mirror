#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/icecream.conf

case "$1" in
	start)
		stat_busy "Starting Icecream Daemon"
		netname=
		if test -n "$ICECREAM_NETNAME"; then
		    netname="-n $ICECREAM_NETNAME"
		fi
		logfile=""
		if test -n "$ICECREAM_LOG_FILE"; then
		    touch $ICECREAM_LOG_FILE
		    logfile="-l $ICECREAM_LOG_FILE"
		fi
		nice= 
		if test -n "$ICECREAM_NICE_LEVEL"; then
		    nice="--nice $ICECREAM_NICE_LEVEL"
		fi
		scheduler=
		if test -n "$ICECREAM_SCHEDULER_HOST"; then
		    scheduler="-s $ICECREAM_SCHEDULER_HOST"
		fi
		noremote=
		if test "$ICECREAM_ALLOW_REMOTE" = "no" 2> /dev/null; then
                    noremote="--no-remote"
		fi
		maxjobs=
		if test -n "$ICECREAM_MAX_JOBS"; then
		    if test "$ICECREAM_MAX_JOBS" -eq 0 2> /dev/null; then
			maxjobs="-m 1"
			noremote="--no-remote"
		    else
			maxjobs="-m $ICECREAM_MAX_JOBS"
		    fi
		fi
		/usr/lib/icecream/sbin/iceccd -d $logfile $nice $netname -b "$ICECREAM_BASEDIR" $maxjobs $noremote  &>/dev/null
		if [ $? -gt 0 ]; then
			stat_fail
		else
			add_daemon icecream
			stat_done
		fi
		;;
	stop)
		stat_busy "Stopping Icecream Daemon"
		killall /usr/lib/icecream/sbin/iceccd > /dev/null 2>&1 || true
		if [ $? -gt 0 ]; then
			stat_fail
		else
			rm_daemon icecream
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

