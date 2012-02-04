#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/lib/urfkill/urfkilld`
case "$1" in
  start)
    stat_busy "Starting rfkill switch daemon"
    [ -z "$PID" ] && /usr/lib/urfkill/urfkilld -f &> /dev/null
    if [ $? -lt 0 ] ; then
      stat_fail
    else
      add_daemon urfkilld                     # create the 'state' dir
      stat_done 
    fi
    ;;
  stop)
    stat_busy "Stopping rfkill switch daemon"
    [ "$PID" ] && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon urfkilld                      # remove the 'state' dir
      stat_done
    fi
    ;;
  restart)
    $0 stop
    sleep 5
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"
esac
exit 0
