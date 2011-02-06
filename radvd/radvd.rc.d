#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/sbin/radvd`
case "$1" in
  start)
    stat_busy "Starting radvd IPv6 RA/RS daemon"
    if [ -z "$PID" ]; then 
       /usr/sbin/radvd
    fi
    if [ ! -z "$PID" -o $? -gt 0 ]; then
      stat_fail
    else
      add_daemon radvd
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping radvd IPv6 RA/RS daemon"
    [ ! -z "$PID" ] && kill $PID &>/dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon radvd
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
