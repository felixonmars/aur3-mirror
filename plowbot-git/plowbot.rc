#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

DAEMON=plowbot
ARGS=

[ -r /etc/conf.d/$DAEMON ] && . /etc/conf.d/$DAEMON

PID=$(ps -o pid,cmd --ppid 1 | grep /usr/bin/$DAEMON | sed 's/ *\([0-9]\+\) .*/\1/')

case "$1" in
 start)
   stat_busy "Starting $DAEMON as user $DAEMON_USER"
   [ -z "$PID" ] && [ -n $DAEMON_USER ] && su -s '/bin/sh' -l $DAEMON_USER -c "/usr/bin/$DAEMON 2>&1 | logger &"
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

