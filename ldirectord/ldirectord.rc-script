#!/bin/bash

daemon_name=ldirectord

. /etc/rc.conf
. /etc/rc.d/functions

ldirectord() {
	/usr/sbin/$daemon_name /etc/ha.d/ldirectord.cf $1
}

case "$1" in
	start)
		stat_busy "Starting $daemon_name daemon"
		;;

	stop)
		stat_busy "Stopping $daemon_name daemon"
		;;

	restart)
		stat_busy "Restarting $daemon_name daemon"
		;;

	status)
		ldirectord $1
		exit $?
		;;

	reload)
		stat_busy "Reloading $daemon_name daemon"
		;;

	*)
		echo "usage: $0 {start|stop|restart|status|reload}"
		exit 0
esac

ldirectord $1

if [[ $? -gt 0 ]]; then
	stat_fail
	exit 1
else
	stat_done
fi

# vim:set ts=2 sw=2 et:
