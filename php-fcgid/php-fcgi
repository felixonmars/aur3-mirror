#!/bin/bash

# general config
. /etc/rc.conf
. /etc/rc.d/functions

NAME="php-fcgi"
EXECUTABLE="/usr/bin/php-cgi"
BIND="127.0.0.1:1026"

PID=`pidof -o %PPID $EXECUTABLE`

case "$1" in
  start)
    stat_busy "Starting $NAME Daemon"
    [ -z "$PID" ] && $EXECUTABLE -b $BIND 2>&1 &
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon $NAME
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping $NAME Daemon"
    [ ! -z "$PID" ] && kill $PID &>/dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon $NAME
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
