#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

RSERVER=/usr/lib/rstudio-server/bin/rserver
DAEMON=rstudio-server
PROCNAME=rserver
PID=$(get_pid $PROCNAME)

[ -r /etc/conf.d/$DAEMON ] && . /etc/conf.d/$DAEMON

case "$1" in
  start)
    stat_busy "Starting R-Studio-Server ..."
[ -z "$PID" ] && $RSERVER $RSTUDIO_SERVER_ARGS &>/dev/null
   if [ $? = 0 ]; then
     add_daemon $DAEMON
     stat_done
   else
     stat_fail
     exit 1
   fi
   ;;
  stop)
    stat_busy "Stopping R-Studio-Server ..."
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
    sleep 5
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"
esac
exit 0



