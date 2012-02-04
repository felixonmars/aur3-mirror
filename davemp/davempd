#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/davempd

case "$1" in
 start)
  stat_busy "Starting DaveMP Daemon"
  if ck_daemon davempd && \
  su -l -s /bin/sh -c '/usr/bin/davempd.pl /etc/davemp.conf &> /dev/null' "${DAVEMPDUSER:-mpd}"; then
   add_daemon davempd
   stat_done
  else
   stat_fail
  fi;;
 stop)
  stat_busy "Stopping DaveMP Daemon"
  if killall davempd.pl &> /dev/null; then
   rm_daemon davempd
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
