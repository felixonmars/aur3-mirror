#!/bin/bash

# general config
. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/bin/zarafa-ical`
case "$1" in
  start)
    stat_busy "Starting Zarafa-iCal"
    [ -z "$PID" ] && /usr/bin/zarafa-ical
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon zarafa-ical
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping Zarafa-iCal"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm -f /var/run/zarafa-ical.pid &>/dev/null
      rm_daemon zarafa-ical
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
