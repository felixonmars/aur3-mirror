#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

NAME=pytivo
FILE=/usr/share/pyTivo/pyTivo.py
PID=`pgrep -f pyTivo.py`
DESCRIPTION=pyTivo

case "$1" in
  start)
    stat_busy "Starting $DESCRIPTION..."
    [ -z "$PID" ] && python $FILE &> /var/log/pytivo.log &
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon $NAME
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping $DESCRIPTION..."
    [ ! -z "$PID" ] && kill -9 $PID &>/dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon $NAME
      stat_done
    fi
    ;;
  restart|force-reload)
    $0 stop
    $0 start
    ;;
esac
exit 0
