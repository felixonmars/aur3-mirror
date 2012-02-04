#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/bin/lineakd`
DISPLAY=":0.0"
case "$1" in
  start)
    stat_busy "Starting Lineak Daemon"
    if [ ! -e /etc/lineakd.conf ]; then
      printhl "/etc/lineakd.conf does not exist!"
      stat_die
    fi
    if [ ! -e /etc/lineakkb.def ]; then
      printhl "/etc/lineakkb.def does not exist!"
      stat_die
    fi
    /usr/bin/lineakd -f /etc/lineakd.conf -e /etc/lineakkb.def &
    if [  $? -gt 0 ]; then
      stat_fail
    else
      add_daemon lineak
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping Lineak Daemon"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    rm_daemon lineak
    stat_done
    ;;
  restart)
    $0 stop
    sleep 1
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"  
esac
