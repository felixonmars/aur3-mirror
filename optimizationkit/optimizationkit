#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions


PID=`pidof -o %PPID /usr/sbin/OptimizationKit`
case "$1" in
  start)
    stat_busy "Starting OptimizationKit Daemon"
    [ -z "$PID" ] && /usr/sbin/OptimizationKit -C /etc/OptimizationKit/OptimizationKit.conf
    if [ $? -gt 0 ]; then
      stat_fail
    else
      echo $(pidof -o %PPID -x /usr/sbin/OptimizationKit) > /var/run/OptimizationKit.pid
      add_daemon OptimizationKit 
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping OptimizationKit Daemon"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm /var/run/OptimizationKit.pid
      rm_daemon OptimizationKit 
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
