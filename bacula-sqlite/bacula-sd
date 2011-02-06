#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

BACULA_SD_BIN=/usr/sbin/bacula-sd
BACULA_SD_CONF=/etc/bacula/bacula-sd.conf
BACULA_SD_PID=`pidof -o %PPID $BACULA_SD_BIN`
BACULA_SD_PIDFILE="var/run/bacula-sd.[0-9]*.pid"
BACULA_SD_PID=$(cat $BACULA_SD_PIDFILE 2>/dev/null)


case "$1" in
  start)
    stat_busy "Starting Bacula Storage Daemon"
    [ -z "$BACULA_SD_PID" ] && $BACULA_SD_BIN -c $BACULA_SD_CONF
     if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon bacula-sd
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping Bacula Storage Daemon"
    [ ! -z "$BACULA_SD_$PID" ] && kill $BACULA_SD_PID &>/dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm -f /var/run/bacula-sd.pid
      rm_daemon bacula-sd
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
