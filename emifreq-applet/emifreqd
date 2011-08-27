#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/sbin/emifreqd`
case "$1" in
  start)
    stat_busy "Starting emifreqd"
    [ -z "$PID" ] && /usr/sbin/emifreqd
    if [ $? -gt 0 ]; then
      stat_fail
    else
      echo $PID > /var/run/emifreqd.pid
      add_daemon emifreqd
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping emifreqd"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm /var/run/emifreqd.pid
      rm_daemon emifreqd
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
