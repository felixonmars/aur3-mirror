#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/sbin/l2tpd`
case "$1" in
  start)
    stat_busy "Starting L2TP Daemon"
    [ -z "$PID" ] && /usr/sbin/l2tpd
    if [ $? -gt 0 ]; then
      stat_fail
    else
      echo $PID > /var/run/l2tp.pid
      add_daemon l2tp
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping L2TP Daemon"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm /var/run/l2tp.pid
      rm_daemon l2tp
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
