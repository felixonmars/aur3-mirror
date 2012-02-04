#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

DAEMON=sickbeard

[ -r /etc/conf.d/$DAEMON ] && . /etc/conf.d/$DAEMON

[ -f $SB_PID_FILE ] && PID=$(cat $SB_PID_FILE)

case "$1" in
 start)
   stat_busy "Starting $DAEMON"
   [ -z "$PID" ] && su - $SB_USER -s /bin/sh -c "$SB_BIN --quiet --nolaunch --daemon --data $SB_DATA --config $SB_CONF --port $SB_PORT --pidfile $SB_PID_FILE" &>/dev/null
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
   [ -n "$PID" ] && kill -TERM $PID &>/dev/null
   if [ $? = 0 ]; then
     timeout=$SB_SHUTDOWN_TIMEOUT; while kill -0 $PID &>/dev/null && [ $timeout -gt 0 ]; do sleep 1; (( timeout-- )); done
     if [ $timeout -gt 0 ]; then
       rm_daemon $DAEMON
       stat_done
     else
       echo "$DAEMON seems to be still running. Please stop it manually and remove $SB_PID_FILE and /run/daemons/$DAEMON." >&2
       stat_fail
       exit 1
     fi
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
