#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/cimon

PID=`pidof -o %PPID /usr/sbin/cimond`

case "$1" in
  start)
    stat_busy "Starting cimon daemon"
    if [ -z "$PID" ]; then 
       /usr/sbin/cimond $DAEMON_ARGS &
    fi
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon cimon
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping cimon daemon"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon cimon
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