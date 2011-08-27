#!/bin/bash

# sourcing our current rc.conf requires this to be a bash script
. /etc/rc.conf
. /etc/rc.d/functions

#rc=0
tair_root=/usr/local/tair
cd $tair_root

PID=`cat $tair_root/logs/config.pid`

case "$1" in
	start)
		stat_busy "Tair config server"
		$tair_root/sbin/tair_cfg_svr -f $tair_root/etc/configserver.conf
	        if [ $? -gt 0 ]; then
	            stat_fail
	        else
	            stat_done
		fi
		;;
	stop)
	    stat_busy "Stopping Tair config server"
	    [ ! -z "$PID" ]  && kill $PID &> /dev/null
	    if [ $? -gt 0 ]; then
	      stat_fail
	    else
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

# vim: set ts=2 noet:
