#!/bin/bash

# general config
. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
  start)
    stat_busy "Starting Jetty Web Application Server"
      /usr/bin/jetty start >/dev/null 2>&1
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon jetty
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping Jetty Web Application Server"
	/usr/bin/jetty stop >/dev/null 2>&1
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon jetty
      stat_done
    fi
    ;;
  restart)
	/usr/bin/jetty restart
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"
esac
