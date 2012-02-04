#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

daemon_name=/usr/lib/AntiVir/guard/avguard
PID=$(pidof -o %PPID $daemon_name.bin)

case "$1" in
  start)
    stat_busy "Starting AntiVir Guard Daemon"
    [[ -z $PID ]] && $daemon_name start &> /dev/null
    if [[ $? -gt 0 ]]; then
      stat_fail
      exit 1
    else
      add_daemon antivird
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping AntiVir Guard Daemon"
    [[ -n $PID ]] && $daemon_name stop &> /dev/null
    if [[ $? -gt 0 ]]; then
      stat_fail
      exit 1
    else
      rm_daemon antivird
      stat_done
    fi
    ;;
  status)
    stat_busy "Probing AntiVir Guard Daemon"
    $daemon_name status &> /dev/null
    if [[ $? -gt 0 ]]; then
      status_stopped
    else
      status_started
    fi
    ;;
  restart)
    $0 stop
    sleep 1
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|status|restart}"
esac
exit 0
