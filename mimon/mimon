#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PIDFILE=/var/run/daemons/mimon
PID=`cat /var/run/daemons/mimon 2>/dev/null`

case "$1" in
  start)
    stat_busy "Starting Mimon daemon"
    if [ ! -f "$PIDFILE" ] || [ -z "$PID" ]; then 
       /usr/bin/mimond -n &
       echo $! > "$PIDFILE"
    fi
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon mimon
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping Mimon daemon"
    [ -f "$PIDFILE" ] && [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon mimon
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

