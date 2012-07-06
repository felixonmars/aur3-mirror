#!/bin/bash

#
# /etc/rc.d/hpasmd
#

. /etc/rc.conf
. /etc/rc.d/functions


PID=$(pidof -x -o %PPID /usr/sbin/hpasmd)
case "${1}" in
  start)
    stat_busy "Starting HP ASM Daemon"
    [ -z "${PID}" ] && /usr/sbin/hpasmd &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      echo "${PID}" > /var/run/hpasmd.pid
      add_daemon hpasmd
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping HP ASM Daemon"
    [ ! -z "${PID}" ] && kill ${PID} &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon hpasmd
      stat_done
    fi
    ;;
  restart) 
    $0 stop 
    sleep 2
    $0 start 
    ;;
  *) echo "usage: $0 {start|stop|restart}"
esac
exit 0
