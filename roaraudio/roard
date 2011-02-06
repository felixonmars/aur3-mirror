#!/bin/bash

# source application-specific settings
ROARD_ARGS=""
[ -f /etc/conf.d/roard ] && . /etc/conf.d/roard

. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
  start)
    stat_busy "Starting Roaraudio Daemon"
    /usr/bin/roard --pidfile /var/run/roard.pid --daemon $ROARD_ARGS
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon roard
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping Roaraudio Daemon"
    /usr/bin/roard --shutdown --pidfile /var/run/roard.pid &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon roard
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
