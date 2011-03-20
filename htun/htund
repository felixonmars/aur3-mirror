#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
 start)
  stat_busy "Starting HTun Daemon"
  if ck_daemon htund && /usr/bin/htund &> /dev/null; then
   add_daemon htund
   stat_done
  else
   stat_fail
  fi;;
 stop)
  stat_busy "Stopping HTun Daemon"
  if pkill -f /usr/bin/htund && ! pgrep -f /usr/bin/htund > /dev/null; then
   rm_daemon htund
   stat_done
  else
   stat_fail
  fi;;
 restart)
  $0 stop
  sleep 1
  $0 start;;
 *)
  echo "usage: $0 {start|stop|restart}"  
esac
exit 0
