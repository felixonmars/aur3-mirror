#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=$(pidof -x $(type -p certmaster))
case "$1" in
  start)
    stat_busy "Starting Certmaster"
    if [ -z "$PID" ]; then 
       /usr/bin/certmaster --daemon &
    fi
    if [ ! -z "$PID" -o $? -gt 0 ]; then
      stat_fail
    else
      PID=$(pidof -x $(type -p certmaster))
      echo $PID > /var/run/certmaster.pid
      add_daemon certmaster
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping Certmaster"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon certmaster
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
