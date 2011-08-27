#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
  start)
    stat_busy "Starting resource manager"
    /usr/sbin/resmgrd
    if [ $? -gt 0 ]; then
      stat_fail
    else
      stat_done
      add_daemon resmgr
    fi
    ;;
  stop)
    stat_busy "Shutting down resource manager"
    /usr/sbin/resmgrd -k
    if [ $? -gt 0 ]; then
      stat_fail
    else
      stat_done
      rm_daemon resmgr
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
