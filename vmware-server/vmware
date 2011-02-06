#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
  start)
    stat_busy "Starting VMware Server"
    /etc/vmware/init.d/vmware start > /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon vmware
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping VMware Server"
    /etc/vmware/init.d/vmware stop > /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon vmware
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
