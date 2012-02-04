#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/bin/orthos`
case "$1" in
  start)
    stat_busy "Starting Orthos Display Manager"
    [ -z "$PID" ] && /usr/bin/orthos &>/dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      echo $PID > /var/run/orthos.pid
      add_daemon orthos
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping Orthos Display Manager"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon orthos
      stat_done
    fi
    ;;
  restart)
    $0 stop
    sleep 3
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"  
esac
exit 0
