#!/bin/bash

daemon_name=cpuminer
daemon_bin=minerd

. /etc/rc.conf
. /etc/rc.d/functions

CPUMINER_WRAPPERS=()
CPUMINER_ARGS=()
. /etc/conf.d/$daemon_name.conf

get_pid() {
	pidof -o %PPID $daemon_bin
}

case "$1" in
  start)
    # Start nscd to workaround random segmentation faults (same problem with foldingathome-smp)
    ck_depends nscd
    stat_busy "Starting $daemon_name daemon"

    PID=$(get_pid)
    if [ -z "$PID" ]; then
      [ -f /var/run/$daemon_name.pid ] && rm -f /var/run/$daemon_name.pid
      # RUN
      nohup "${CPUMINER_WRAPPERS[@]}" $daemon_bin "${CPUMINER_ARGS[@]}" > /dev/null 2>&1 &
      #
      if [ $? -gt 0 ]; then
        stat_fail
        exit 1
      else
        echo $(get_pid) > /var/run/$daemon_name.pid
        add_daemon $daemon_name
        stat_done
      fi
    else
      stat_fail
      exit 1
    fi
    ;;

  stop)
    stat_busy "Stopping $daemon_name daemon"
    PID=$(get_pid)
    # KILL
    [ ! -z "$PID" ] && kill $PID &> /dev/null
    #
    if [ $? -gt 0 ]; then
      stat_fail
      exit 1
    else
      rm -f /var/run/$daemon_name.pid &> /dev/null
      rm_daemon $daemon_name
      stat_done
    fi
    ;;

  restart)
    $0 stop
    sleep 3
    $0 start
    ;;

  status)
    stat_busy "Checking $daemon_name status";
    ck_status $daemon_name
    ;;

  *)
    echo "usage: $0 {start|stop|restart|status}"
esac

exit 0
