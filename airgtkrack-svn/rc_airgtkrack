#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/bin/airgtkrack`
case "$1" in
  start)
    stat_busy "Starting airgtkrack-dameon"
    [ -z "$PID" ] && /usr/bin/airgtkrack --daemon &
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon airgtkrack
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping airgtkrack-daemon"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon airgtkrack
      stat_done
    fi
    ;;
  status)
    [ ! -z "$PID" ] && exit 1
    exit 0
    ;;
  restart)
    $0 stop
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"  
esac
exit 0
