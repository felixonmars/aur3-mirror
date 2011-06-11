#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
  start)
    stat_busy "Sleeping 10 seconds"
    sleep 10
    stat_done
    ;;
  stop)
    ;;
  restart)
  $0 stop
  $0 start
  ;;
*)
    echo "usage: $0 {start|stop|restart}"
esac
exit 0
