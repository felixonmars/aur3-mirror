#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/sbin/cpupowerd`
case "$1" in
  start)
    stat_busy "Starting cpupowerd"
    [ -z "$PID" ] && /usr/sbin/cpupowerd -d -c /etc/cpupowerd.conf
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon cpupowerd
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping cpupowerd"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon cpupowerd
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
