#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions


PID=`pidof -o %PPID /usr/bin/lcdproc`
case "$1" in
  start)
    stat_busy "Starting LCDproc system status monitor: "
    [ -z "$PID" ] && /usr/bin/lcdproc
    if [ $? -gt 0 ]; then
      stat_fail
    else
      echo $PID > /var/run/lcdproc.pid
      add_daemon lcdproc
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping LCDproc system status monitor: "
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm /var/run/lcdproc.pid
      rm_daemon lcdproc
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

