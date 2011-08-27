#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
  start)
    stat_busy "Starting ioniced I/O priority daemon"
    /sbin/ioniced &>/dev/null &
    if [ $? -gt 0 ]; then
      stat_fail
    else
      stat_done
      add_daemon ioniced 
    fi
    ;;
  stop)
    stat_busy "Stopping ioniced I/O priority daemon"
    killall ioniced &>/dev/null &
    if [ $? -gt 0 ]; then
      stat_fail
    else
      stat_done
      rm_daemon ioniced
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
