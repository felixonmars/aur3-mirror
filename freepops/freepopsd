#!/bin/bash
#
# A script for launch FreePOPs at startup on Linux systems
# Version: 0.0.2
# Author: Ivan Gasperoni <gaspe (at) libero (dot) it>

. /etc/rc.conf
. /etc/rc.d/functions

PREFIX="/usr/bin" # The FreePOPs installation path
PID=`pidof -o %PPID /usr/bin/freepopsd` # freepopsd pid

case "$1" in
	start)
	  stat_busy "Starting freepops deamon"
	  $PREFIX/freepopsd -d
	  if [ $? -gt 0 ]; then
	     stat_fail
	  else
	     stat_done
	  fi
	  ;;
	stop)
	  stat_busy "Stopping freepops deamon"
	  [ ! -z "$PID" ] && $PREFIX/freepopsd -k &> /dev/null
	  if [ $? -gt 0 ]; then
	     stat_fail
	  else
	     stat_done
	  fi
	  ;;
	restart)
	  $0 stop
	  sleep 3
	  $0 start
	  ;;
	*)
	  echo "Usage: freepops {start|stop|restart}"
	  exit 1
	  ;;
esac
exit 0

