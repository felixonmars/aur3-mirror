#!/bin/bash
#
# SOVA network2 start/stop script.
#
# based on AUR/community/openntpd 3.9p1-7 package start/stop script
# by Vesa Kaihlavirta (vegai), vegai at amessage dot info
#

CONF=/etc/conf.d/network2

. /etc/rc.conf
. /etc/rc.d/functions

[ -f $CONF ] && . $CONF

case "$1" in
  start)
	stat_busy "Starting SOVA network2"
	
	binaries_paths
	custom_variables
	start_networking
	
	if [ "$?" -gt 0 ]
	then
    	    stat_fail
	else
	    stat_done
	fi
    ;;
  stop)
	stat_busy "Stopping SOVA network2"

	binaries_paths
	custom_variables
	stop_networking

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

