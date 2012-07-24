#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
  start)
    stat_busy "Starting Unvanquished Server"
    /usr/bin/sudo -u unvanquished unvanquished-server +set dedicated 1 +exec server.cfg >/dev/null 2>&1 &
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon unvanquished
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping Unvanquished Server"
    /usr/bin/sudo -u unvanquished /usr/bin/pkill unvanquished >/dev/null 2>&1
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon unvanquished
      stat_done
    fi
    ;;
  restart)
    $0 stop
    sleep 1
    $0 start $2
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"
    ;;
esac

