#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/bin/lcd-stuff`
case "$1" in
  start)
    stat_busy "Starting lcd-stuff"
    [ -z "$PID" ] && /usr/bin/lcd-stuff -c /etc/lcd-stuff.conf -f 0
    if [ $? -gt 0 ]; then
      stat_fail
    else
      echo $PID > /var/run/lcd-stuff.pid
      add_daemon lcd-stuff
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping lcd-stuff"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm /var/run/lcd-stuff.pid
      rm_daemon lcd-stuff
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
