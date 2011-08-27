#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

. /etc/conf.d/cgred

if [ -n "$LOG_FILE" ]; then
  LOG_FILE="--log-file=$LOG_FILE"
fi

PID=`pidof -o %PPID /usr/sbin/cgrulesengd`
case "$1" in
  start)
    stat_busy "Starting CGroups rules engine daemon"
    if [ -z "$PID" ]; then 
      /usr/sbin/cgrulesengd $LOG $LOG_FILE
    fi
    if [ ! -z "$PID" -o $? -gt 0 ]; then
      stat_fail
    else
      add_daemon cgred
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping CGroups rules engine daemon"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon cgred
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

# vim:set ft=sh:
