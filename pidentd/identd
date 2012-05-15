#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/sbin/identd`
case "$1" in
  start)
    stat_busy "Starting identd"
    [ -z "$PID" ] && /usr/sbin/identd
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon identd
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping identd"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon identd
      stat_done
    fi
    ;;
  restart)
    $0 stop
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"  
esac
exit 0
