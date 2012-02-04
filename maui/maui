#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

DAEMON=maui
DAEMONPATH=/usr/sbin/maui

case "$1" in
 start)
   	stat_busy "Starting $DAEMON"
  	$DAEMONPATH
  	stat_done
   ;;
 stop)
   	stat_busy "Stopping $DAEMON"
   	if [ "$(pidof $DAEMON)" = "" ]; then 
   		stat_fail
   	else
   		kill $(pidof $DAEMON)
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

