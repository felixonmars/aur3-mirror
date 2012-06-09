#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

DAEMON=neubot
ARGS=start

[ -r /etc/conf.d/$DAEMON ] && . /etc/conf.d/$DAEMON

# Note: cannot use pidof because neubot is running as "python2 neubot..."
PID=$(cat /var/run/neubot.pid)


case "$1" in
 start)
   stat_busy "Starting $DAEMON"
   [ -z "$PID" ] && $DAEMON $ARGS &>/dev/null
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
