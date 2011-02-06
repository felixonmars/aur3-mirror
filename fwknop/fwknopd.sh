#!/bin/bash

. /etc/rc.d/functions

_name=fwknopd

_config=/etc/fwknop/fwknopd.conf
_access=/etc/fwknop/access.conf

case "$1" in
	start)
		stat_busy "Starting $_name"
		/usr/sbin/fwknopd -c $_config -a $_access
		if [ $? -gt 0 ]; then
			stat_fail
		else
			add_daemon fwknopd
			stat_done
		fi
		;;

	stop)
		stat_busy "Stopping $_name"
		/usr/sbin/fwknopd -c $_config -K
		if [ $? -gt 0 ]; then
			stat_fail
		else
			rm_daemon fwknopd
			stat_done
		fi
		;;

	restart)
		$0 stop
		$0 start
		;;

	status)
		/usr/sbin/fwknopd -c $_config -S
		;;

	*)
		echo "usage: $0 {start|stop|restart|status}"
esac

exit 0
