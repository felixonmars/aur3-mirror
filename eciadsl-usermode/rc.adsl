#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
  start)
    stat_busy "Starting adsl"
    /usr/bin/eciadsl-start
    if [ $? -gt 0 ]; then
      stat_fail
    else
      stat_done
      add_daemon adsl
    fi
    ;;
  stop)
    stat_busy "Stopping adsl"
    /usr/bin/eciadsl-stop
    if [ $? -gt 0 ]; then
      stat_fail
    else
      stat_done
      rm_daemon adsl
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
