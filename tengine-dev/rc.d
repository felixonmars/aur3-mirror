#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

function check_config {
  stat_busy "Checking tengine configuration"
  /usr/sbin/tengine -t -q -c /etc/tengine/tengine.conf
  if [ $? -ne 0 ]; then
    stat_die
  else
    stat_done
  fi
}

case "$1" in
  start)
    check_config
    $0 careless_start
    ;;
  careless_start)
    stat_busy "Starting tengine"
    if [ -s /var/run/tengine.pid ]; then
      stat_fail
      # probably ;)
      stat_busy "Tengine is already running"
      stat_die
     fi
    /usr/sbin/tengine -c /etc/tengine/tengine.conf &>/dev/null
    if [ $? -ne 0 ]; then
      stat_fail
    else
      add_daemon tengine
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping tengine"
    PID=$(cat /var/run/tengine.pid)
    kill -QUIT $PID &>/dev/null
    if [ $? -ne 0 ]; then
      stat_fail
    else
      for i in {1..10}; do
        [ -d /proc/$PID ] || { stat_done; rm_daemon tengine; exit 0; }
        sleep 1
      done
      stat_fail
    fi
    ;;
  restart)
    check_config
    $0 stop
    sleep 1
    $0 careless_start
    ;;
  reload)
    check_config
    if [ -s /var/run/tengine.pid ]; then
      status "Reloading tengine configuration" kill -HUP $(cat /var/run/tengine.pid)
    fi
    ;;
  check)
    check_config
    ;;
  *)
    echo "usage: $0 {start|stop|restart|reload|check|careless_start}"
esac
