#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

[ -f /etc/conf.d/cdpolld ] && . /etc/conf.d/cdpolld

DEVLIST=${DEVLIST:-/dev/sr0}
TIMEOUT=${TIMEOUT:-2}

poll_daemon(){
	PIDFILE="/var/run/`basename $0`.pid"

	touch $PIDFILE &>/dev/null
	[ $? -gt 0 ] && return 1
	SELFPID=`pidof -x $0`
	(
		trap "rm -f $PIDFILE;return 0" 0 &>/dev/null
		trap "rm -f $PIDFILE;return 0" SIGINT &>/dev/null
		trap "rm -f $PIDFILE;return 0" SIGQUIT &>/dev/null
		trap "rm -f $PIDFILE;return 0" SIGKILL &>/dev/null
		trap "rm -f $PIDFILE;return 0" SIGTERM &>/dev/null

		pidof -o $SELFPID -x $0 >$PIDFILE
		[ $? -gt 0 ] && return 1
		while [ -n "1" ]; do
			for DEV in "${DEVLIST[@]}"; do
				touch $DEV |logger
			done
			sleep $TIMEOUT
		done
	) &
	return 0
}

start(){
	stat_busy "Starting cdpolld"
	PID=`pidof -x -o %PPID cdpolld`
	[ -z $PID ] && poll_daemon 
	if [ $? -gt 0 ]; then
		stat_fail
	else
		add_daemon cdpolld
		stat_done
	fi
}

stop(){
	stat_busy "Stopping cdpolld"
	PID=`pidof -x -o %PPID cdpolld`
	[ ! -z $PID ] && kill $PID &>/dev/null
	if [ $? -gt 0 ]; then
		stat_fail
	else
		rm_daemon cdpolld
		stat_done
	fi
}

case "$1" in
  start) start;;
  stop) stop;;
  restart) stop; sleep 2; start;;
  *) echo "usage: $0 {start|stop|restart}";;
esac
exit 0
