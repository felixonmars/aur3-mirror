#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=$(pidof -o %PPID /usr/sbin/rlocated)
case "$1" in
  start)
    stat_busy "Starting rlocate daemon"
    [ -z "$PID" ] && /usr/sbin/rlocated
    if [ $? -gt 0 ]; then
      stat_fail
    else
      PID=$(pidof -o %PPID /usr/sbin/rlocated)
      echo $PID >/var/run/rlocate.pid
      add_daemon rlocate
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping rlocate daemon"
    [ ! -z "$PID" ]  && kill $PID &>/dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon rlocate
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
