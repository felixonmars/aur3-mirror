#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

ACTIVEMQ_HOME=/opt/activemq
PIDFILE="$ACTIVEMQ_HOME/data/activemq.pid"
PID=`cat $PIDFILE`
umask=077

case "$1" in
	start)
		stat_busy "Starting ActiveMQ"
		[ -z "$PID" -o ! -d "/proc/$PID" ] && JAVA_HOME=/opt/java $ACTIVEMQ_HOME/bin/activemq start >/dev/null 2>&1 &
		if [ $? -gt 0 ]; then
			stat_fail
		else
			add_daemon activemq
			stat_done
		fi
		;;
	stop)
		stat_busy "Stopping ActiveMQ"
		[ ! -z "$PID" -a -d "/proc/$PID" ] && kill $PID &> /dev/null
		: > $PIDFILE
		if [ $? -gt 0 ]; then
			stat_fail
		else
			rm_daemon activemq
			stat_done
		fi
		;;
	restart)
		$0 stop
		while [ ! -z "$PID" -a -d "/proc/$PID" ]; do sleep 1; done
		$0 start
		;;
	*)
		echo "usage: $0 {start|stop|restart}"
esac
exit 0
