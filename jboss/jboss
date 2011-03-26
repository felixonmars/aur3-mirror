#!/bin/bash

# general config
. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
  start)
    stat_busy "Starting JBoss Application Server"
    /opt/jboss/bin/run.sh >/dev/null 2>&1 &
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon jboss
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping JBoss Application Server"
    /opt/jboss/bin/shutdown.sh -S &>/dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon jboss
      stat_done
    fi
    ;;
  restart)
    $0 stop
    sleep 10
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"  
esac
