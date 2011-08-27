#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/ngetty

PID=`pidof -o %PPID /sbin/ngetty`
case $1 in
  	start)
  		stat_busy "Starting ngetty"  
  		[ -z "$PID" ] && /sbin/ngetty $NGETTY_TTYS &
		if [ $? -gt 0 ]; then
      			stat_fail
    		else
      			add_daemon ngetty
			
		fi
		;;
  	stop)
		stat_busy "Stopping ngetty"
		killall ngetty
		if [ $? -gt 0 ]; then
      			stat_fail
    		else
      			stat_done
      			rm_daemon ngetty
    		fi
		;;
  	*)
	echo "Usage: $0 start|stop"
esac
