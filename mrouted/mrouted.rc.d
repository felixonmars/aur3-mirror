#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

DAEMON=mrouted
DAEMONBIN=/usr/sbin/$DAEMON

PID=`pidof -o %PPID $DAEMONBIN`
case "$1" in
  start)
    stat_busy "Starting $DAEMON Daemon"
    [ -z "$PID" ] && $DAEMONBIN
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon $DAEMON
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping $DAEMON Daemon"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon $DAEMON
      stat_done
    fi
    ;;
  restart)
    $0 stop
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"  
esac
exit 0
