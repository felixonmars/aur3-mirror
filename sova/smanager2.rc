#!/bin/bash
#
#  SOVA Services Manager 2 start/stop script.
#
#  based on AUR/community/openntpd 3.9p1-7 package start/stop script
#  by Vesa Kaihlavirta (vegai), vegai at amessage dot info
#

CONF=/etc/conf.d/smanager2

. /etc/rc.conf
. /etc/rc.d/functions

[ -f $CONF ] && . $CONF

case "$1" in
  start)
	stat_busy "Launching SOVA Service Manager's services:"
	
	binaries_paths
	custom_variables
	start_smanager
	
	if [ "$?" -gt 0 ]
	then
    	    stat_fail
	else
	    stat_done
	fi
    ;;
  stop)
	stat_busy "Stopping SOVA Service Manager's services:"

	binaries_paths
	custom_variables
	stop_smanager

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

