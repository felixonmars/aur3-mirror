#!/bin/bash

# general config
. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/bin/opentracker`

case "$1" in
  start)
    stat_busy "Starting opentracker Daemon"
    [ -z "$PID" ] && su nobody -s /bin/sh -c "/usr/bin/opentracker -f /etc/opentracker/config&"
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon opentracker
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping opentracker Daemon"
    [ ! -z "$PID" ] && kill $PID &>/dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon opentracker
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
