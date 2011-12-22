#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

DAEMON=fwknopd

CONFIG_FILE=/etc/fwknop/fwknopd.conf
ACCESS_FILE=/etc/fwknop/access.conf

case "$1" in
	start)
		stat_busy "Starting $DAEMON"
		/usr/sbin/fwknopd -c $CONFIG_FILE -a $ACCESS_FILE
		if [ $? -gt 0 ]; then
			stat_fail
		else
			add_daemon $DAEMON
			stat_done
		fi
		;;

	stop)
		stat_busy "Stopping $DAEMON"
		/usr/sbin/fwknopd -c $CONFIG_FILE -K
		if [ $? -gt 0 ]; then
			stat_fail
		else
			rm_daemon $DAEMON
			stat_done
		fi
		;;

	restart)
		$0 stop
		sleep 1
		$0 start
		;;

	status)
		/usr/sbin/fwknopd -c $CONFIG_FILE -S
		stat_done
		;;

	*)
		echo "usage: $0 {start|stop|restart|status}"
esac

exit 0
