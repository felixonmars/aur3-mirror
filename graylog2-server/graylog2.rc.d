#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/graylog2

PIDFILE="/tmp/graylog2.pid"

check_pid() {
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
	if check_pid; then
		local PID=$(cat "$PIDFILE" 2> /dev/null)
		kill $PID &> /dev/null
		local RET=$?
		check_pid
		return $RET
	fi
	return 1
}

wait_pid() {
	while check_pid; do sleep 1; done
}

case "$1" in
	start)
		stat_busy "Starting graylog2"
		check_pid || $JAVA_HOME/bin/java -jar $JAVA_OPTS /usr/lib/graylog2-server.jar > /dev/null &
		if [ $? -gt 0 ]; then
			stat_fail
		else
			add_daemon graylog2
			stat_done
		fi
		;;
	stop)
		stat_busy "Stopping graylog2"
		if ! kill_pid; then
			stat_fail
		else
			rm_daemon graylog2
			stat_done
		fi
		;;
	restart)
		$0 stop
		wait_pid
		$0 start
		;;
	*)
		echo "usage: $0 {start|stop|restart}"
esac
exit 0
