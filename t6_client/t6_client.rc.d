#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof %PPID /usr/sbin/t6_client`
case "$1" in
  start)
    stat_busy "Starting tunnel6 client"
    if [ -z "$PID" ]; then
       /usr/sbin/t6_client -d
    fi
    if [ -n "$PID" -o $? -ne 0 ]; then
      stat_fail
    else
      add_daemon t6_client
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping tunnel6 client"
    [ -n "$PID" ] && kill $PID &>/dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon t6_client
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

