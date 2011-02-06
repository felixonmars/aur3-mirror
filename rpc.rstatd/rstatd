#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

DAEMON_NAME=rstatd
RSTATD_PID=`pidof -o %PPID /usr/sbin/rpc.rstatd`
case "$1" in
  start)
    if [ ! -f /var/run/daemons/rpcbind ]; then 
      /etc/rc.d/rpcbind start
      if [ $? -gt 0 ]; then
        stat_fail
        exit 1
      fi
    fi
    stat_busy "Starting $DAEMON_NAME"
    [ -z "$RSTATD_PID" ] && /usr/sbin/rpc.rstatd
    if [ $? -gt 0 ]; then
      stat_fail
      exit 1
    else
      echo `pidof -o %PPID /usr/sbin/rpc.rstatd` > /var/run/rpc.rstatd.pid
    fi
    add_daemon $DAEMON_NAME
    stat_done
    ;;

  stop)
    stat_busy "Stopping $DAEMON_NAME"
    [ ! -z "$RSTATD_PID" ] && kill $RSTATD_PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
      exit 1
    else
      rm /var/run/rpc.rstatd.pid &> /dev/null
    fi
    rm_daemon $DAEMON_NAME
    stat_done
    ;;

  restart)
    $0 stop
    sleep 2
    $0 start
    ;;

  *)
    echo "usage: $0 {start|stop|restart}"  
esac
exit 0
