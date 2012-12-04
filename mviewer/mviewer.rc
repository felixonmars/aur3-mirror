#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

DAEMON=mviewer
ARGS=
DAEMON_DIR=/opt/mviewer
PATH=/usr/sbin:/usr/bin:/sbin:/bin:/opt/java/jre/bin

[ -r /etc/conf.d/$DAEMON ] && . /etc/conf.d/$DAEMON

PID=$(get_pid $DAEMON)

case "$1" in
 start)
   stat_busy "Starting $DAEMON"
   # I'd like to use the start.sh script provided but it's relative and doesn't work as a system executable.
   [ -z "$PID" ] && java -jar $DAEMON_DIR/winstone-0.9.10.jar \
    --httpPort=$ARGS --ajp13Port=-1 --warfile=$DAEMON_DIR/mViewer.war &>/dev/null &
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
