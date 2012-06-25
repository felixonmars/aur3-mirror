#!/bin/bash

daemon_name=chiliproject
daemon_command="ruby /var/lib/chiliproject/script/server -d -e production"
logfile="/var/lib/chiliproject/log/production.log"

. /etc/rc.conf
. /etc/rc.d/functions

get_pid() {
	pgrep -u chiliproject -f "${daemon_command}"
}

case "$1" in
  start)
    stat_busy "Starting $daemon_name daemon"

    PID=$(get_pid)
    if [ -z "$PID" ]; then
      [ -f /run/$daemon_name.pid ] && rm -f /run/$daemon_name.pid
      # RUN
      su -s '/bin/sh' chiliproject -c "${daemon_command} &>>${logfile}"
      #
      if [ $? -gt 0 ]; then
        stat_fail
        exit 1
      else
        echo $(get_pid) > /run/$daemon_name.pid
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
    [ -n "$PID" ] && kill -INT $PID &> /dev/null
    #
    if [ $? -gt 0 ]; then
      stat_fail
      exit 1
    else
      rm -f /run/$daemon_name.pid &> /dev/null
      rm_daemon $daemon_name
      stat_done
    fi
    ;;

  restart)
    $0 stop
    sleep 1
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
