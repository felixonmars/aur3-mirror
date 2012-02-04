#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

DAEMON_BINARY="/usr/sbin/sheep"
DAEMON=sheepdog

. /etc/conf.d/$DAEMON

PID=$(get_pid $DAEMON_BINARY)

case "$1" in
   start)
      stat_busy "Starting $DAEMON"
      if [ -z "$PID" ]; then
         su -s /bin/sh "$SHEEPDOG_USER" -c "$DAEMON_BINARY $SHEEPDOG_ARGS $SHEEPDOG_PATH" &>/dev/null
      fi
      if [ $? = 0 ]; then
         add_daemon $DAEMON
         stat_done
      else
         stat_fail
         exit 1
      fi
   ;;
   stop)
      stat_busy "Stopping $DAEMON"
      [ -n "$PID" ] && kill $PID &>/dev/null
      if [ $? = 0 ]; then
         rm_daemon $DAEMON
         stat_done
      else
         stat_fail
         exit 1
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
