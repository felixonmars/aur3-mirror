#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
# . /etc/mgetty+sendfax/faxrunq.config

PID=`pidof -x -o %PPID /usr/sbin/faxrunqd`
case "$1" in
  start)
    stat_busy "Starting faxrunqd"
    if [ -z "$PID" ]; then 
       su fax -c /usr/sbin/faxrunqd &
#       su -c /usr/sbin/faxrunqd &
    fi
    if [ ! -z "$PID" -o $? -gt 0 ]; then
      stat_fail
    else
      PID=`pidof -x -o %PPID /usr/sbin/faxrundq`
      echo $PID > /var/run/faxrunqd.pid
      add_daemon faxrunqd
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping faxrunqd"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon faxrunqd
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
