#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

DAEMON=sickbeard

[ -r /etc/default/$DAEMON ] && . /etc/default/$DAEMON
[ -r /etc/conf.d/$DAEMON ] && . /etc/conf.d/$DAEMON

PID=$(get_pid $DAEMON)

case "$1" in
 start)
   stat_busy "Starting $DAEMON"
   [ -z "$PID" ] && su - $SB_USER -s /bin/sh -c "$SB_BIN --quiet --nolaunch --daemon --data $SB_DATA --config $SB_CONF --port $SB_PORT" &>/dev/null
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
   wget -q --delete-after $SB_PROTOCOL://127.0.0.1:$SB_PORT/home/shutdown/ &> /dev/null
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
