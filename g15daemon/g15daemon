#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/sbin/g15daemon`
case "$1" in
  start)
    stat_busy "Starting g15daemon"
    [ -z "$PID" ] && /usr/sbin/g15daemon
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon g15daemon
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping g15daemon"
    [ ! -z "$PID" ] && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon g15daemon
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
