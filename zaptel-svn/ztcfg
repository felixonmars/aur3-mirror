#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=`cat /var/run/ztcfg.pid 2>/dev/null`
case "$1" in
  start)
    stat_busy "Starting ztcfg"
    [ -z "$PID" ] && /sbin/ztcfg
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon ztcfg
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping ztcfg"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon ztcfg
      stat_done
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
exit 0
