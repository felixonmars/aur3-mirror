#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

case $1 in
  start)
    stat_busy "Starting Logitech_applet"
     /usr/bin/logitech_applet -s 800 -e &>/dev/null
     if [ $? -gt 0 ]; then
	     stat_fail
     else
	     stat_done
     fi
     ;;
  stop)
    stat_busy "Stopping Logitech_applet"
    /usr/bin/logitech_applet -s 400 -d &>/dev/null
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
     echo "usge: $0 {start|stop|restart}";;
esac 
