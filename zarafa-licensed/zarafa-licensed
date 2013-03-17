#!/bin/bash

# general config
. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/bin/zarafa-licensed`
case "$1" in
  start)
    stat_busy "Starting Zarafa-Licensed"
    [ -z "$PID" ] && LD_LIBRARY_PATH=/opt/ubuntu1004libs/ /usr/bin/zarafa-licensed 2>/dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon zarafa-licensed
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping Zarafa-Licensed"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm -f /var/run/zarafa-licensed.pid &>/dev/null
      rm_daemon zarafa-licensed
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
