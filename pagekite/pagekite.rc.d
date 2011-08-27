#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

DAEMON=pagekite.py
PID=$(pidof -x $DAEMON)

case "$1" in
 start)
   stat_busy "Starting $DAEMON"
   if [ -z "$PID" ] && $DAEMON --optfile /etc/pagekite.conf; then
     add_daemon pagekite
     stat_done
   else
     stat_fail
     exit 1
   fi
   ;;
 stop)
   stat_busy "Stopping $DAEMON"
   if [ -n "$PID" ] && kill $PID; then
     rm_daemon pagekite
     stat_done
   else
     stat_fail
     exit 1
   fi
   ;;
 restart)
   $0 stop
   $0 start
   ;;
 *)
   echo "usage: $0 {start|stop|restart}"  
esac
