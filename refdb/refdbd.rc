#!/bin/bash

# source application-specific settings

# general config
. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
  start)
    stat_busy "Starting RefDB Bibliography server"
    /usr/bin/refdbctl start &>/dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon refdbd
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping RefDB Bibliography server"
    /usr/bin/refdbctl stop &>/dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon refdbd
      stat_done
    fi
    ;;
  restart)
    $0 stop
    sleep 3
    $0 start
    ;;
  reload)
    if [ -f /var/run/httpd.pid ]; then
      status "Reloading RefDB Configuration"
      /usr/sbin/refdbctl reload
    fi
    ;;
  *)
    echo "usage: $0 {start|stop|restart|reload}"  
esac
