#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/sbin/mt-daapd`
case "$1" in
  start)
    stat_busy "Starting mt-daapd"
    [ -z "$PID" ] && /usr/sbin/mt-daapd
    if [ $? -gt 0 ]; then
      stat_fail
    else
      echo $PID > /var/run/mt-daapd.pid
      add_daemon mt-daapd
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping mt-daapd"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm /var/run/mt-daapd.pid
      rm_daemon mt-daapd
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
