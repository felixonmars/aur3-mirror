#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=$(pidof -x $(type -p funcd))
case "$1" in
  start)
    stat_busy "Starting Func Daemon"
    if [ -z "$PID" ]; then 
       /usr/bin/funcd --daemon &
    fi
    if [ ! -z "$PID" -o $? -gt 0 ]; then
      stat_fail
    else
      PID=$(pidof -x $(type -p funcd))
      echo $PID > /var/run/funcd.pid
      add_daemon funcd
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping Func Daemon"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon funcd
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
