#!/bin/bash

daemon_name=ashd
bin_name=htparser

. /etc/rc.conf
. /etc/rc.d/functions

ASHD_ARGS=()
ASHD_ROOT_HANDLER_ARGS=()

. /etc/conf.d/$daemon_name.conf

get_pid() {
    pidof -o %PPID $bin_name
}

case "$1" in
  start)
    stat_busy "Starting $daemon_name"

    PID=$(get_pid)
    if [ -z "$PID" ]; then
      [ -f /var/run/$daemon_name.pid ] && rm -f /var/run/$daemon_name.pid
      # Build command line
      command_line=($bin_name -f -p /var/run/$daemon_name.pid)
      [ ! -z ${ASHD_USER} ] && command_line+=(-u ${ASHD_USER})
      [ ! -z ${ASHD_ROOT} ] && command_line+=(-r ${ASHD_ROOT})
      command_line+=("${ASHD_ARGS[@]}")
      [ ! -z ${ASHD_PORTSPEC} ] && command_line+=(${ASHD_PORTSPEC} --) || { stat_fail; exit 1; }
      [ ! -z ${ASHD_ROOT_HANDLER} ] && command_line+=(${ASHD_ROOT_HANDLER}) || { stat_fail; exit 1; }
      command_line+=("${ASHD_ROOT_HANDLER_ARGS[@]}")
      # RUN
      "${command_line[@]}"
      #
      if [ $? -gt 0 ]; then
        stat_fail
        exit 1
      else
        add_daemon $daemon_name
        stat_done
      fi
    else
      stat_fail
      exit 1
    fi
    ;;

  stop)
    stat_busy "Stopping $daemon_name"
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
