#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
  start)
    stat_busy "Starting HighPoint RAID Management Service"
    /usr/bin/hptsvr /etc/hptcfg &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon hptsvr
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping HighPoint RAID Management Service"
    /usr/bin/hptsvr --kill /etc/hptcfg &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon hptsvr
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
