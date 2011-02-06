#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

test -f /usr/sbin/thinkfan || exit 0

case "$1" in
  start)
    stat_busy "Starting thinkfan"
    /usr/sbin/thinkfan -- -q -s5 >/dev/null 2>&1
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon thinkfan
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping thinkfan"
    PID=$(</var/run/thinkfan.pid)
    kill $PID
    rm -f /var/run/thinkfan.pid
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon thinkfan
      stat_done
    fi
    ;;
  restart)
    stat_busy "Restarting thinkfan"

    PID=$(</var/run/thinkfan.pid)
    kill $PID
    rm -f /var/run/thinkfan.pid
    if [ $? -gt 0 ]; then
      stat_fail
      rm_daemon thinkfan
    else
    /usr/sbin/thinkfan -- -q -s5 >/dev/null 2>&1
      if [ $? -gt 0 ]; then
        stat_fail
        rm_daemon thinkfan
      else
        stat_done
      fi
    fi
    ;;
  *)
      echo "Usage: $0 {stop|start|restart}"
    ;;
esac
exit 0
