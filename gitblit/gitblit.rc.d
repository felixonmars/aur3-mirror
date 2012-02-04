#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

DAEMON=gitblit

GITBLIT_LOG=/var/log/gitblit/gitblit.log
GITBLIT_USER=gitblit
GITBLIT_JAVA_OPTS="-server -Xmx1024M"
GITBLIT_START_ARGS=""
GITBLIT_STOP_ARGS="--stop"

[ -r /etc/profile.d/jdk.sh ] && . /etc/profile.d/jdk.sh
[ -r /etc/conf.d/$DAEMON ] && . /etc/conf.d/$DAEMON

case "$1" in
 start)
   stat_busy "Starting $DAEMON"
   if ck_daemon $DAEMON; then
     su -s '/bin/sh' $GITBLIT_USER -c "cd && $JAVA_HOME/bin/java $GITBLIT_JAVA_ARGS -jar gitblit.jar $GITBLIT_START_ARGS 2>&1 >>$GITBLIT_LOG" &>/dev/null &
     add_daemon $DAEMON
     stat_done
   else
     stat_fail
     exit 1
   fi
   ;;
 stop)
   stat_busy "Stopping $DAEMON"
   if ! ck_daemon $DAEMON; then
     su -s '/bin/sh' $GITBLIT_USER -c "cd && $JAVA_HOME/bin/java $GITBLIT_JAVA_ARGS -jar gitblit.jar $GITBLIT_STOP_ARGS" &>/dev/null
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
