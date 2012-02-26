#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/wetabhdmi

PIDFILE=/var/run/wetabhdmi.pid
PID=$(cat $PIDFILE 2>/dev/null)
if ! readlink -q /proc/$PID/exe | grep -q '^/usr/bin/tiitoo-hdmi-daemon'; then
	PID=
	rm $PIDFILE &>/dev/null
fi

case "$1" in
	start)
		stat_busy 'Starting WeTab HDMI Daemon'
		[[ -d /var/empty ]] || mkdir -p /var/empty
		if [[ ! -z $PID ]]; then
      modprobe i2c-dev && mv $DEVICE /dev/i2c-2 && /usr/bin/tiitoo-hdmi-daemon &>/dev/null
    fi
		if [[ $? -gt 0 ]]; then
			stat_fail
		else
			add_daemon wetabhdmi
			stat_done
		fi
		;;
	stop)
		stat_busy 'Stopping WeTab HDMI Daemon'
		[[ ! -z $PID ]] && kill $PID &> /dev/null
		if [[ $? -gt 0 ]]; then
			stat_fail
		else
			rm_daemon wetabhdmi
			stat_done
		fi
		;;
	restart)
		$0 stop
		sleep 1
		$0 start
		;;
	*)
		echo "usage: $0 {start|stop|restart}"
esac
exit 0
