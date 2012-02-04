#!/bin/sh

. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
	start)
		stat_busy "Starting nfblock"
		. /etc/default/nfblock

		ARGS="-d /var/lib/nfblock/*"
		[ "$DBUS" = "0" ] && ARGS="$ARGS --no-dbus"
		[ "$SYSLOG" = "0" ] && ARGS="$ARGS --no-syslog"
		nfblockd ${ARGS}

		if [ $? = "0" ]; then
			stat_done
		else
			stat_fail
		fi
		;;
	stop)
		stat_busy "Stopping nfblock"
		PID=`cat /var/run/nfblockd.pid 2>/dev/null`
		if [ -z "$PID" ]; then
			stat_fail
		else
			kill $PID
			if [ $? -gt 0 ]; then
				stat_fail
			else
				stat_done
			fi
		fi
		;;
	restart)
		$0 stop
		sleep 5 # One second isn't enough.
		$0 start
		;;
	reload)
		stat_busy "Reloading nfblock blocklist(s) and resetting stats"
		PID=`cat /var/run/nfblockd.pid 2>/dev/null`
		if [ -z "$PID" ]; then
			stat_fail
		else
			kill -HUP $PID
			if [ $? -gt 0 ]; then
				stat_fail
			else
				stat_done
			fi
		fi
		;;
	stats)
		stat_busy "Dumpping nfblock stats to syslog"
		PID=`cat /var/run/nfblockd.pid 2>/dev/null`
		if [ -z "$PID" ]; then
			stat_fail
		else
			kill -USR1 $PID
			if [ $? -gt 0 ]; then
				stat_fail
			else
				stat_done
			fi
		fi
		;;
	*)
		echo "usage: $0 {start|stop|restart|reload|stats}"
		;;
esac

# vim: noet ff=unix
