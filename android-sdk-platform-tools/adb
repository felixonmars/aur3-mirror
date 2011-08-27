#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

DAEMON="adb"
DAEMON_PATH="/opt/android-sdk/platform-tools"
ARGS="start-server"

[ -r /etc/conf.d/$DAEMON ] && . /etc/conf.d/$DAEMON

case "$1" in
 start)
   stat_busy "Starting $DAEMON"
   $DAEMON_PATH/$DAEMON $ARGS &>/dev/null
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
   $DAEMON_PATH/$DAEMON "kill-server" &>/dev/null
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

