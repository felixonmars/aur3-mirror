#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=`cat /var/run/pygopherd.pid 2>/dev/null`
case "$1" in
  start)
    stat_busy "Starting pygopherd"
    [ -z "$PID" ] && /usr/bin/pygopherd
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon pygopherd #CONTINUE HERE
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping pygopherd"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null && rm /var/run/pygopherd.pid
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon pygopherd
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
