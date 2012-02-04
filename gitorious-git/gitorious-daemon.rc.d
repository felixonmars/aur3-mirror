#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

BUNDLE="/opt/ruby-enterprise/bin/bundle"
PID_FILE="$GITORIOUS_HOME/log/git-daemon.pid"

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
		stat_busy "Starting gitorious daemon"
		check_pid "$PID_FILE" || su - git -c "$BUNDLE exec script/git-daemon -d"
		if [ $? -gt 0 ]; then
			stat_fail
		else
			add_daemon gitorious-daemon
			stat_done
		fi
		;;
	stop)
		stat_busy "Stopping gitorious daemon"
		if ! kill_pid "$PID_FILE"; then
			stat_fail
		else
			rm_daemon gitorious-daemon
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
