#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/sbin/owampd`
case "$1" in
  start)
    stat_busy "Starting owampd One-Way Ping daemon"
    if [ -z "$PID" ]; then 
       /usr/bin/owampd -c /etc/owamp/
    fi
    if [ ! -z "$PID" -o $? -gt 0 ]; then
      stat_fail
    else
      add_daemon owampd
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping owampd One-Way Ping daemon"
    [ ! -z "$PID" ] && kill $PID &>/dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon owampd
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
