#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

get_pid() {
  PID=`pidof -o %PPID /usr/sbin/gmond`
}
get_pid

case "$1" in
  start)
    stat_busy "Starting Ganglia gmond"
    [ -z "$PID" ] && /usr/sbin/gmond
    if [ $? -gt 0 ]; then
      stat_fail
      exit 1
    else
      sleep 1
      get_pid
      if [ $? -gt 0 ]; then
        stat_fail
        exit 1
      else
        echo $PID > /var/run/gmond.pid
        add_daemon gmond
        stat_done
      fi
    fi
    ;;

  stop)
    stat_busy "Stopping Ganglia gmond"
    [ ! -z "$PID" ]  && kill $PID > /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
      exit 1
    else
      sleep 1
      get_pid
      if [ $? -gt 0 ]; then
        rm /var/run/gmond.pid
        rm_daemon gmond
        stat_done
      else
        stat_fail
        exit 1
      fi
    fi
    ;;

  restart)
    $0 stop
    sleep 1
    $0 start
    ;;

  *)
    echo "usage: $0 {start|stop|restart}"
    exit 1

esac
