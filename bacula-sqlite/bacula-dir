#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

BACULA_DIR_BIN=/usr/sbin/bacula-dir
BACULA_DIR_CONF=/etc/bacula/bacula-dir.conf
BACULA_DIR_PIDFILE="var/run/bacula-dir.[0-9]*.pid"
BACULA_DIR_PID=$(cat $BACULA_DIR_PIDFILE 2>/dev/null)

case "$1" in
  start)
    stat_busy "Starting Bacula Director Daemon"
    [ -z "$BACULA_DIR_PID" ] && $BACULA_DIR_BIN -c $BACULA_DIR_CONF
     if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon bacula-dir
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping Bacula Director Daemon"
    [ ! -z "$BACULA_DIR_PID" ] && kill $BACULA_DIR_PID &>/dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm -f /var/run/$BACULA_DIR_PIDFILE
      rm_daemon bacula-dir
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
