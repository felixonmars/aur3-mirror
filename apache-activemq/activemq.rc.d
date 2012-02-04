#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

ACTIVEMQ_HOME=/opt/activemq
PIDFILE="$ACTIVEMQ_HOME/data/activemq.pid"
umask=077

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
		stat_busy "Starting ActiveMQ"
		check_pid || JAVA_HOME=/opt/java $ACTIVEMQ_HOME/bin/activemq start >/dev/null 2>&1 &
		if [ $? -gt 0 ]; then
			stat_fail
		else
			add_daemon activemq
			stat_done
		fi
		;;
	stop)
		stat_busy "Stopping ActiveMQ"
		if ! kill_pid; then
			stat_fail
		else
			rm_daemon activemq
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
