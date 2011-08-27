#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

BACULA_FD_BIN=/usr/sbin/bacula-fd
BACULA_FD_CONF=/etc/bacula/bacula-fd.conf
BACULA_FD_PIDFILE="var/run/bacula-fd.[0-9]*.pid"
BACULA_FD_PID=$(cat $BACULA_FD_PIDFILE 2>/dev/null)


case "$1" in
  start)
    stat_busy "Starting Bacula File Daemon"
    [ -z "$BACULA_FD_PID" ] && $BACULA_FD_BIN -c $BACULA_FD_CONF
     if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon bacula-fd
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping Bacula File Daemon"
    [ ! -z "$BACULA_FD_PID" ] && kill $BACULA_FD_PID &>/dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm -f /var/run/bacula-fd.pid
      rm_daemon bacula-fd
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
