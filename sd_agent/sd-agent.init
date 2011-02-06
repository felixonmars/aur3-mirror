#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
  start)
    stat_busy "Starting sd-agent"
    [ ! -f /var/run/sd-agent.pid ] && /usr/bin/sd-agent/agent.py start init --clean
    if [ $? -gt 0 ]; then
      stat_fail
    else
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping sd-agent"
    [ -f /var/run/sd-agent.pid ] && /usr/bin/sd-agent/agent.py stop init
    if [ $? -gt 0 ]; then
      stat_fail
    else
      stat_done
    fi
    ;;
  restart)
    $0 stop
    sleep 3
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"
esac
exit 0
