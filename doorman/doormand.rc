#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=`cat /var/run/doormand.pid 2>/dev/null`
case "$1" in
  start)
    stat_busy "Starting Doorman Port Knocking Daemon"
    if [ -z "$PID" ]; then 
       /usr/sbin/doormand &
    fi
    if [ ! -z "$PID" ]; then
      stat_fail
    else
      add_daemon doormand
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping Doorman Port Knocking Daemon"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon doormand
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
