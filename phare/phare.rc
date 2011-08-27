#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
  start)
    stat_busy "Starting python HTTP server"
    if $(ck_daemon phare); then
      cd /srv/phare
      nohup /usr/bin/python -m http.server 8080 &>> /var/log/phare.log &
    fi
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon phare 
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping python HTTP server"
    ck_daemon phare || ps ax | awk '/python.*http\.server 8080/ {print $1}' | xargs kill
    rm_daemon phare
    stat_done
    ;;
  restart)
    $0 stop
    sleep 1
    $0 start
    ;;
  status)
    stat_busy 'Checking python HTTP server status'
    ck_status phare
    ;;
  *)
    echo "usage: $0 {start|stop|restart|status}"
esac
exit 0
