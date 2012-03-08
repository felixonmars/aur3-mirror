#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

get_pid() {
  PID=`pidof -o %PPID /usr/sbin/gmetad`
}
get_pid

case "$1" in
  start)
    stat_busy "Starting Ganglia gmetad"
    [ -z "$PID" ] && /usr/sbin/gmetad
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
        echo $PID > /var/run/gmetad.pid
        add_daemon gmetad
        stat_done
      fi
    fi
    ;;

  stop)
    stat_busy "Stopping Ganglia gmetad"
    [ ! -z "$PID" ]  && kill $PID > /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
      exit 1
    else
      sleep 1
      get_pid
      if [ $? -gt 0 ]; then
        rm /var/run/gmetad.pid
        rm_daemon gmetad
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
