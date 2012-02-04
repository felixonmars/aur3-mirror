#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/remserial.conf

case "$1" in
  start)
    stat_busy "Starting remserial daemon"
    PID=`pidof -o %PPID /usr/bin/remserial`>/dev/null
    if [ $? -eq 0 ]; then
      stat_fail
    else
      remserial -d -p$RemPort -s "$RemSpeed $RemType" $RemDev &
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping remserial daemon"
    PID=`pidof -o %PPID /usr/bin/remserial`>/dev/null
    if [ $? -ne 0 ]; then
      stat_fail
    else
      kill $PID
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
