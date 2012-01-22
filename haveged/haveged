#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/sbin/haveged`
case "$1" in
  start)
    stat_busy "Starting havege entropy daemon"
    [ -z "$PID" ] && /usr/sbin/haveged
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon haveged
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping havege entropy daemon"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon haveged
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
