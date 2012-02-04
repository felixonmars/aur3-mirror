#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
  start)
    stat_busy "Starting PBMPCD"
    start-stop-daemon -S -c mpd -m -p /var/run/pbmpcd.pid -b -x /usr/bin/pbmpcd -- -b
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon pbmpcd
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping PBMPCD"
    start-stop-daemon -K -c mpd -m -p /var/run/pbmpcd.pid
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon pbmpcd
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
exit 0
