#!/bin/bash
. /etc/rc.conf
. /etc/rc.d/functions

pidfile="/run/monitorix.pid"
if [[ -r $pidfile ]]; then
	read -r PID < "$pidfile"
	if [[ ! -d /proc/$PID ]]; then
		unset PID && rm -f "$pidfile" # stale pidfile
	fi
fi

args=(-c /etc/monitorix.conf -p "$pidfile")

case "$1" in
	start)
		stat_busy "Starting Monitorix"
		if [[ -z $PID ]] && /usr/bin/monitorix "${args[@]}"; then
			add_daemon monitorix
			stat_done
		else
			stat_fail
			exit 1
		fi
		;;

	stop)
		stat_busy "Stopping Monitorix"
		if [[ $PID ]] && kill $PID &> /dev/null; then
			rm_daemon monitorix
			[[ -f $pidfile ]] && rm -f $pidfile
			stat_done
		else
			stat_fail
			exit 1
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

