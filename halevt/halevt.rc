#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/bin/halevt`

case "$1" in
  
  start)
    stat_busy "Starting halevt"
    [ -z "$PID" ] && /usr/bin/halevt
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon halevt
      stat_done
    fi
    ;;
  
  stop)
    stat_busy "Stopping halevt"
    [ ! -z "$PID" ] && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon halevt
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
