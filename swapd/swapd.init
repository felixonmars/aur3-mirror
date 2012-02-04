#!/bin/bash

# source application-specific settings

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/sbin/swapd`
case "$1" in
  start)
    stat_busy "Starting SWAPD Daemon"
    [ -z "$PID" ] && /usr/sbin/swapd
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon swapd
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping SWAPD Daemon"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon swapd
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
