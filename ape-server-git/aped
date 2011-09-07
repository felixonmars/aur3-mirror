#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/bin/aped`
case "$1" in
  start)
    stat_busy "Starting AJAX Push Engine"
    if [ -z "$PID" ]; then
       date >> /var/log/aped.log
       /usr/bin/aped --cfg /etc/ape/ape.conf &>>/var/log/aped.log  &
    fi
    if [ ! -z "$PID" -o $? -gt 0 ]; then
      stat_fail
    else
      add_daemon aped
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping AJAX Push Engine"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon esd
      stat_done
    fi
    ;;
  kill)
    stat_busy "Killing AJAX Push Engine"
    [ ! -z "$PID" ]  && kill -9 $PID &> /dev/null
    rm_daemon esd
    stat_done
    ;;
  restart)
    $0 stop
    sleep 1
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"  
esac

