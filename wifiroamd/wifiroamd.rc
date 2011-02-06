#!/bin/bash

return_value=0
daemon_name=wifiroamd

. /etc/rc.conf
. /etc/rc.d/functions

get_pid() {
	pgrep -f 'python \S+'$daemon_name
}

case "$1" in
  start)
    stat_busy "Starting $daemon_name"

    rm -f /etc/wifiroamd/disabled || true

    PID=`get_pid`
    if [ -z "$PID" ]; then
      [ -f /var/run/$daemon_name.pid ] && rm -f /var/run/$daemon_name.pid
      # RUN
      /usr/sbin/$daemon_name &
      sleep 1
      pkill -0 -f 'python \S+'$daemon_name
      return_value=$?
      if [ $return_value -gt 0 ]; then
        stat_fail
        return_value=1
      else
        echo `get_pid` > /var/run/$daemon_name.pid
        add_daemon $daemon_name
        stat_done
      fi
    else
      stat_fail
      return_value=1
    fi
    ;;

  stop)
    stat_busy "Stopping $daemon_name"
    PID=`get_pid`
    # KILL
    [ ! -z "$PID" ] && kill $PID &> /dev/null
    return_value=$?
    if [ $return_value -gt 0 ]; then
      stat_fail
      return_value=1
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
    return_value=$?
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"
    return_value=1
esac
exit $return_value

#EOF
