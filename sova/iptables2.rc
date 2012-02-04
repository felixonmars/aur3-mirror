#!/bin/bash
#
#  SOVA iptables2 start/stop script.
#
#  based on AUR/community/openntpd 3.9p1-7 package start/stop script
#  by Vesa Kaihlavirta (vegai), vegai at amessage dot info
#

CONF=/etc/conf.d/iptables2

. /etc/rc.conf
. /etc/rc.d/functions

[ -f $CONF ] && . $CONF

case "$1" in
  start)
	stat_busy "Starting SOVA iptables2"
	
	binaries_paths
	custom_variables
	start_iptables
	
	if [ "$?" -gt 0 ]
	then
    	    stat_fail
	else
	    stat_done
	fi
    ;;
  stop)
	stat_busy "Stopping SOVA iptables2"

	binaries_paths
	custom_variables
	stop_iptables

	if [ "$?" -gt 0 ]
	then
	    stat_fail
	else
	    stat_done
	fi
    ;;
  restart)
    $0 stop
    sleep 2
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"  
esac

exit 0

# EOF

