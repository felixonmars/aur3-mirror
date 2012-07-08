#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

daemon_name="minbif"
daemon_exec="/usr/bin/${daemon_name}"
daemon_conf="/etc/${daemon_name}/${daemon_name}.conf"
daemon_pidf="/run/${daemon_name}/${daemon_name}.pid"

PID=$(pidof -o %PPID "$daemon_exec")

case "$1" in
start)
	stat_busy "Starting $daemon_name daemon"

	[ -z $PID ] || stat_die
	rm -f "$daemon_pidf"

	CMD="$daemon_exec --pidfile $daemon_pidf $daemon_conf"
	su -s /bin/sh -c "$CMD" "$daemon_name"

	if [ $? -gt 0 ]
	then
		stat_die
	else
		add_daemon "$daemon_name"
		stat_done
	fi

	;;
stop)
	stat_busy "Stopping $daemon_name daemon"

	[ -n $PID ] && kill $PID &> /dev/null

	if [ $? -gt 0 ]
	then
		stat_die
	else
		rm -f "$daemon_pidf"
		rm_daemon "$daemon_name"
		stat_done
	fi

	;;
restart)
	$0 stop
	sleep 3
	$0 start

	;;
*)
	echo "usage: $0 {start|stop|restart}"
esac

exit 0
