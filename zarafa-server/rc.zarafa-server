#!/bin/bash

# general config
. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/bin/zarafa-server`
case "$1" in
  start)
    stat_busy "Starting Zarafa-Server"
    [ -z "$PID" ] && /usr/bin/zarafa-server
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon zarafa-server
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping Zarafa-Server"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm -f /var/run/zarafa-server.pid &>/dev/null
      rm_daemon zarafa-server
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
