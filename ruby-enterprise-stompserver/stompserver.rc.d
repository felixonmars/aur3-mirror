#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID_FILE="/var/lib/stompserver/log/stompserver.pid"

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
		stat_busy "Starting stompserver"
		check_pid "$PID_FILE" || /opt/ruby-enterprise/bin/stompserver -C /etc/stompserver.conf &> /dev/null
		if [ $? -gt 0 ]; then
			stat_fail
		else
			add_daemon git-daemon
			stat_done
		fi
		;;
	stop)
		stat_busy "Stopping stompserver"
		if ! kill_pid "$PID_FILE"; then
			stat_fail
		else
			rm_daemon git-daemon
			stat_done
		fi
		;;
	restart)
		$0 stop
		sleep 1
		wait_pid "$PID_FILE"
		$0 start
		;;
	*)
		echo "usage: $0 {start|stop|restart}"
esac
exit 0
