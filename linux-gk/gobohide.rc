#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/gobohide.conf

case "$1" in
    start)
    	stat_busy "Starting GoboHide"
        for dir in ${UserDefinedEntries[@]}
	do
	    if [ -d "$dir" -o -h "$dir" ]
	    then
		gobohide --hide "$dir"
	    fi
	done
	stat_done
        ;;
    stop)
    	stat_busy "Stopping GoboHide"
	gobohide --flush
	stat_done
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
