#!/bin/bash

daemon_name=tircd

. /etc/rc.conf
. /etc/rc.d/functions

if [ -x /etc/conf.d/$daemon_name.conf ]; then
. /etc/conf.d/$daemon_name.conf
fi

get_pid() {
	pidof -o %PPID -x $daemon_name.pl
}

case "$1" in
  start)
    stat_busy "Starting $daemon_name daemon"

    PID=$(get_pid)
    if [ -z "$PID" ]; then
      [ -f /var/run/$daemon_name.pid ] && rm -f /var/run/$daemon_name.pid
      # RUN
      su tircd -c "$daemon_name.pl $CFGFILE &"
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
