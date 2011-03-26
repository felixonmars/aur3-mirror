#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/sbin/macfanctld`
case "$1" in
  start)
    stat_busy "Starting macfanctld"
    [ -z "$PID" ] && /usr/sbin/macfanctld
    if [ $? -gt 0 ]; then
      stat_fail
    else
      echo $PID > /var/run/macfanctld.pid
      add_daemon macfanctld
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping macfanctld"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm /var/run/macfanctld.pid
      rm_daemon macfanctld
      stat_done
    fi
    ;;
  restart)
    $0 stop
    sleep 2
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"  
esac

exit 0
