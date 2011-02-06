#!/bin/bash
# Beanstalkd Archlinux rc.d script
#
# by Chien-An "Zero" Cho
# Copyright by hypo, Bigs Lab. (http://htpo.cc/)

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/beanstalkd

PID=`cat /var/run/beanstalkd.pid 2>/dev/null`
case "$1" in
  start)
    stat_busy "Starting Beanstalkd"
    [ -z "$PID" ] && /usr/bin/beanstalkd $BEANSTALKD_ARGS
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon beanstalkd
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping beanstalkd"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon beanstalkd
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
