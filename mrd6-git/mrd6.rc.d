#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=$(pidof -o %PPID /usr/sbin/mrd6)
case "$1" in
  start)
    stat_busy "Starting mrd6"
    [ -z "$PID" ] && /usr/sbin/mrd6 -D
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon mrd6
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping mrd6"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon mrd6
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
