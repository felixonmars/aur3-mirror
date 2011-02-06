#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/bin/bfilter`
case "$1" in
  start)
    stat_busy "Starting BFilter Daemon"
    [ -z "$PID" ] && /usr/bin/bfilter -u bfilter -g bfilter -c /etc/bfilter
    if [ $? -gt 0 ]; then
      stat_fail
    else
      echo $PID > /var/run/bfilter.pid
      add_daemon bfilter
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping BFilter Daemon"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm /var/run/bfilter.pid
      rm_daemon bfilter
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
