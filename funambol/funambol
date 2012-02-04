#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

export JAVA_HOME=$(grep -h JAVA_HOME= /etc/profile.d/* | sed '/^#/d' | sed -e 's/.*JAVA_HOME=//' | head -n 1)

case "$1" in
  start)
    stat_busy "Starting Funambol server"
    /opt/Funambol/bin/funambol start
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon funambol
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping Funambol server"
    /opt/Funambol/bin/funambol stop
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon funambol
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
