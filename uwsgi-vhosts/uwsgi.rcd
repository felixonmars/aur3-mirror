#!/bin/bash
# uwsgi init script for Arch linux

# editable settings are in /etc/conf.d/uwsgi

. /etc/conf.d/uwsgi
. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
  start)
    stat_busy "Starting uwsgi"
    $START_COMMAND
    if [ $? -ne 0 ]; then
        stat_fail
    else
        add_daemon uwsgi
        stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping uwsgi"
    PID=$(cat $UWSGI_PID)
    kill -QUIT $PID &>/dev/null
    if [ $? -ne 0 ]; then
      stat_fail
    else
      for i in `seq 1 10`; do
        [ -d /proc/$PID ] || { stat_done; rm_daemon uwsgi; rm $UWSGI_PID; exit 0; }
        sleep 1
      done
      # fail if we reach this
      stat_fail
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
