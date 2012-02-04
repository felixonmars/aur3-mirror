#!/bin/bash

# source application-specific settings
[ -f /etc/conf.d/ipset ] && . /etc/conf.d/ipset

# Set defaults if settings are missing
[ -z "$IPSET_CONF" ] && IPSET_CONF=/etc/ipset/ipset.rules

. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
	start)
		if [ ! -f "$IPSET_CONF" ]; then
			echo "Cannot load ipset rules: $IPSET_CONF is missing!" >&2
			exit 1
		fi
		stat_busy "Starting IP Sets"
		if ck_daemon ipset; then
			/usr/sbin/ipset restore < $IPSET_CONF
			if [ $? -gt 0 ]; then
				stat_fail
			else
				add_daemon ipset
				stat_done
			fi
		else
			stat_fail
		fi
		;;
	stop)
		stat_busy "Stopping IP Sets"
		if ! ck_daemon ipset; then
			/usr/sbin/ipset destroy
			if [ $? -gt 0 ]; then
				stat_fail
			else
				rm_daemon ipset
				stat_done
			fi
		else
			stat_fail
		fi
		;;
	restart)
		$0 stop
		$0 start
		;;
	save)
		stat_busy "Saving IP Sets"
		/usr/sbin/ipset save > $IPSET_CONF
		if [ $? -gt 0 ]; then
			stat_fail
		else
			stat_done
		fi
		;;
	*)
		echo "usage: $0 {start|stop|restart|save}"
esac
exit 0
