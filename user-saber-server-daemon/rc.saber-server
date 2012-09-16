#!/bin/bash

. $HOME/etc/rc.conf
. $HOME/etc/rc.d/functions
. $HOME/etc/conf.d/saber-server

p_pid="$HOME/var/run/saber-server.pid"
p_log="$HOME/var/log/saber-server.log"

[[ -f $p_pid ]] && PID=$(cat $p_pid)
[[ -d /proc/$PID ]] || PID=""

case "$1" in
  start)
		stat_busy "Starting saber server daemon ($USER)"

    if [ -z "$PID" ]; then
			saber server --log $p_log $ARGS &
      echo $! > $p_pid
    fi

    if [ $? -gt 0 ]; then
      stat_fail                                                                 
    else
      add_daemon saber-server
      stat_done
    fi
    ;;
  stop)
		stat_busy "Stopping saber server daemon ($USER)"

		if [ ! -z "$PID" ]; then 
      kill $PID &> /dev/null
      rm $p_pid
    fi

		if [ $? -gt 0 ]; then
			stat_fail
    else
      rm_daemon saber-server
      stat_done
		fi
    ;;
  restart)
    $0 stop
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"
		;;
esac
exit 0
