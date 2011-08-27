#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/bin/monitorix`
MARGS="-c /etc/monitorix.conf"

case "$1" in
  start)
   stat_busy "Starting Monitorix"
    if [ -z "$PID" ]; then
       /usr/bin/monitorix $MARGS
    fi
    if [ ! -z "$PID" -o $? -gt 0 ]; then
      stat_fail
    else
      PID=`pidof -o %PPID /usr/bin/monitorix`
      echo $PID > /var/run/monitorix.pid
      add_daemon monitorix
      stat_done
    fi
    ;;

  stop)
    stat_busy "Stopping Monitorix"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon monitorix
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
