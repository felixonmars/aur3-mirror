#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

name=couchbase-server

. /etc/conf.d/couchbase

PIDFILE="/var/lib/couchbase/couchbase-server.pid"
if [ -f $PIDFILE ]; then
	PID=`cat $PIDFILE`
else
	PID=1
fi

[[ $PID -eq `get_pid beam.smp` ]]

is_up=$?

grep $COUCHBASE_USER /etc/passwd &>/dev/null || useradd -r $COUCHBASE_USER -d /var/lib/couchbase

case "$1" in
start)
	ulimit -n $COUCHBASE_MAXCONNS
	mkdir -p /var/run/couchdb
	chown -R $COUCHBASE_USER /var/log/couchdb /var/lib/couchbase /var/lib/couchdb /var/run/couchdb
	stat_busy "Starting $name daemon"
	[[ $is_up -ne 0 ]] && /bin/su -s /bin/sh -c "/usr/bin/$name $COUCHBASE_ARGS" $COUCHBASE_USER \
	&& { add_daemon $name; stat_done; } \
	|| { stat_fail; exit 1; }
	;;
stop)
	stat_busy "Stopping $name daemon"
	[[ $is_up -eq 0 ]] && kill $PID &>/dev/null \
	&& { rm_daemon $name; stat_done; } \
	|| { stat_fail; exit 1; }
	;;
restart)
	$0 stop
	sleep 3
	$0 start
	;;
*)
	echo "usage: $0 {start|stop|restart}"
	;;
esac
exit 0
