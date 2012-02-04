#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=$(pidof -o %PPID upsmon)


case "$1" in
  start)
    stat_busy "Starting Upsmon Daemon"
    if [ -x /opt/upsmon ]; then
      /opt/upsmon/upsagent &> /dev/null
      if [ $? -gt 0 ]; then
        stat_fail
      else
        stat_done
        add_daemon upsmon
      fi
    fi
    ;;
  stop)
    stat_busy "Stopping Upsmon Daemon"
    killall upsagent &> /dev/null
    if [ $? = 0 ]; then
      rm_daemon upsmon
      stat_done
    else
      stat_fail
      exit 1
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
