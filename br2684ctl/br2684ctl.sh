#!/bin/sh
#
# Daemon for configuring RFC 2684 ATM/Ethernet bridging
# Uses /sbin/br2684ctl utility.
#
. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
	start)
	    stat_busy "Bridging ATM on PPPoE"   
            /usr/sbin/br2684ctl -b -c 0 -a 0.35 &>/dev/null 
            if [ $? -gt 0 ]; then
               stat_fail
            else
               sleep 5
  	       add_daemon br2684ctl
	       stat_done
            fi
 	    ;;

	stop)
	    stat_busy "Removing ATM on PPPoE Bridge..."
            killall -KILL br2684ctl &>/dev/null
            if [ $? -gt 0 ]; then
               stat_fail
            else
               rm_daemon br2684ctl
               stat_done
            fi
	    ;;

	restart)
           $0 stop
           sleep 1
           $0 start
	   ;;

	*)
	   echo $"Usage: $0 {start|stop|restart}"
	   exit 1
	;;
esac
exit 0
