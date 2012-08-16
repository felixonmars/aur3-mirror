#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID_FILE="/run/gitorious-resque-worker.pid"

check_pid() {
	local PIDFILE="$1"
	[ ! -f "$PIDFILE" ] && return 1
	local PID=$(cat "$PIDFILE" 2> /dev/null)
	[ -z "$PID" ] && return 1
	if [ ! -d "/proc/$PID" ]; then
		rm -f "$PIDFILE" 2> /dev/null
		return 1
	fi
	return 0
}

kill_pid() {
	local PIDFILE="$1"
	if check_pid "$PIDFILE"; then
		local PID=$(cat "$PIDFILE" 2> /dev/null)
		kill $PID &> /dev/null
		local RET=$?
		check_pid "$PIDFILE"
		return $RET
	fi
	return 1
}

wait_pid() {
	while check_pid "$1"; do sleep 1; done
}

case "$1" in
	start)
		stat_busy "Starting gitorious resque worker"
		check_pid "$PID_FILE" && stat_fail
		PID=$(/bin/su - git -c "RAILS_ENV=production QUEUE=* bin/rake environment resque:work >/dev/null 2>&1 & echo \$!")
		if [ $? -gt 0 ]; then
			stat_fail
		else
			echo $PID > $PID_FILE
			add_daemon gitorious-resque-worker
			stat_done
		fi
		;;
	stop)
		stat_busy "Stopping gitorious resque worker"

		if ! kill_pid "$PID_FILE"; then
			stat_fail
		else
			rm_daemon gitorious-resque-worker
			stat_done
		fi
		;;
	restart)
		$0 stop
		wait_pid "$PID_FILE"
		$0 start
		;;
	*)
		echo "usage: $0 {start|stop|restart}"
esac
exit 0

