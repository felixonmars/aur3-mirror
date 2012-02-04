#!/bin/bash

# general config
. /etc/rc.conf
. /etc/rc.d/functions

JAVA_HOME="/opt/java"
export JAVA_HOME

case "$1" in
  start)
    stat_busy "Starting JBoss Web Server"
    /usr/share/jboss-web/bin/startup.sh >/dev/null 2>&1 &
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon jboss-web
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping JBoss Web Server"
    /usr/share/jboss-web/bin/shutdown.sh -S &>/dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon jboss-web
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
