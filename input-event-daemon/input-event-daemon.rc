#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/bin/input-event-daemon`
case "$1" in
  start)
    stat_busy "Starting input-event-daemon"
    [ -z "$PID" ] && /usr/bin/input-event-daemon
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon input-event-daemon
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping input-event-daemon"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon input-event-daemon
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
