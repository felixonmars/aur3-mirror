#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID -x /usr/bin/cdvserver`
PIDFILE="/var/run/cdvserver.pid"
case "$1" in
  start)
    stat_busy "Starting Codeville Server"
    [ -z "$PID" ] && /usr/bin/cdvserver
    if [ $? -gt 0 ]; then
      stat_fail
    else
      echo `pidof -o %PPID -x /usr/bin/cdvserver` > $PIDFILE
      add_daemon cdv
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping Codeville Server"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm $PIDFILE
      rm_daemon cdv
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
