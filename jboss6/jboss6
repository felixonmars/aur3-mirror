#!/bin/bash

# general config
. /etc/rc.conf
. /etc/rc.d/functions

LOG_FILE=/var/log/jboss6.log

case "$1" in
  start)
    stat_busy "Starting JBoss Application Server 6"
    /usr/share/jboss6/bin/run.sh >> ${LOG_FILE} 2>&1 &
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon jboss6
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping JBoss Application Server 6"
    /usr/share/jboss6/bin/shutdown.sh -S >> ${LOG_FILE} 2>&1 &
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon jboss6
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
