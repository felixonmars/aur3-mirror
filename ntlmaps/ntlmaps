#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/bin/python /usr/bin/ntlmaps`
case "$1" in
  start)
    stat_busy "Starting ntlmaps"
    if [ -z "$PID" ]; then 
       /usr/bin/ntlmaps > /var/log/ntlmaps.log 2>&1 &
    fi
    if [ ! -z "$PID" -o $? -gt 0 ]; then
      stat_fail
    else
      add_daemon ntlmaps
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping ntlmaps"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon ntlmaps
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
