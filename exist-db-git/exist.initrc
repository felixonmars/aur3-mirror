#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/profile.d/jre.sh
. /etc/profile.d/exist.sh

get_pid() {
  pgrep exist-startup
}

case "$1" in
  start)
    stat_busy "Starting eXist-db server"

    PID=$(get_pid)
    if [ -z "$PID" ]; then
      [ -f /var/run/exist.pid ] && rm -f /var/run/exist.pid
      # RUN
      exist-startup &> /dev/null &
      sleep 4
      #
      if [ $? -gt 0 ]; then
        stat_fail
        exit 1
      else
        echo $(get_pid) > /var/run/exist.pid
        add_daemon exist
        stat_done
      fi
    else
      stat_fail
      exit 1
    fi
    ;;

  stop)
    stat_busy "Stopping eXist-db server"
    PID=$(get_pid)
    if [ ! -z "$PID" ]; then
      # KILL
      exist-shutdown &> /dev/null
      sleep 4
      #
      rm -f /var/run/exist.pid &> /dev/null
      rm_daemon exist
      stat_done
    else
      stat_fail
      exit 1
    fi
    ;;

  restart)
    $0 stop
    $0 start
    ;;

  status)
    stat_busy "Checking eXist-db status";
    ck_status exist
    ;;

  *)
    echo "usage: $0 {start|stop|restart|status}"
esac

exit 0
