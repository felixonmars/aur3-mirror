#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/seeks

PID=`pidof -o %PPID /usr/bin/seeks`

case "$1" in
  start)
    stat_busy "Starting seeks daemon"
    [ -z "$PID" ] && /usr/bin/seeks $SEEKS_ARGS
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon seeks
      stat_done
    fi
    ;;

  stop)
    stat_busy "Stopping seeks daemon"
    [ ! -z "$PID" ] && kill $PID &> /dev/null 
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon seeks
      stat_done
    fi
    ;;
  restart)
    $0 stop
    while [ ! -z "$PID" -a -d "/proc/$PID" ]; do sleep 1; done 
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"

esac
exit 0
