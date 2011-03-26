#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
case "$1" in
  start)
    stat_busy "Starting gopreload Daemon"
    gopreload &> /var/log/gopreload.log &
    add_daemon gopreload
    stat_done
    ;;
  stop)
    stat_busy "Stopping gopreload Daemon"
    pkill bin/gopreload &> /dev/null
    pkill mapandlock &> /dev/null
    rm_daemon gopreload
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
exit 0
