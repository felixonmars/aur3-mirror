#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/sbin/tpmd`
case "$1" in
  start)
    stat_busy "Starting tpmd"
    [ -z "$PID" ] && /usr/sbin/tpmd
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon tpmd
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping tpmd"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon tpmd
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
