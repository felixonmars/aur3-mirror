#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

# source application-specific settings

PID=`pidof -o %PPID /usr/bin/gld`

case "$1" in
  start)
       stat_busy "Starting gld"
       [ -z "$PID" ] && /usr/bin/gld
       if [ $? -gt 0 ]; then
          stat_fail
       else
          add_daemon gld
          stat_done
       fi
    ;;
  stop)
       stat_busy "Stopping gld"
   	[ -n "$PID" ] && kill $PID &> /dev/null
        if [ $? -gt 0 ]; then
           stat_fail
        else
           rm_daemon gld
           stat_done
        fi

    ;;
  restart)
    $0 stop
    # will not start if not fully stopped, so sleep
    sleep 2
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"  
esac
exit 0
