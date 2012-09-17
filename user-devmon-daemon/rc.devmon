#!/bin/bash

. ~/etc/rc.conf
. ~/etc/rc.d/functions
. ~/etc/conf.d/devmon

p_pid="$HOME/var/run/devmon.pid"
p_log="$HOME/var/log/devmon.log"

[[ -f $p_pid ]] && PID=$(cat $p_pid)
[[ -d /proc/$PID ]] || PID=""
[ ! -f $p_session ] && touch $p_session

case "$1" in
  start)
    stat_busy "Starting devmon daemon"

    if [ -z "$PID" ]; then
			devmon $ARGS &>$p_log &
      echo $! > $p_pid
		else
			echo "${C_OTHER}SKIP${C_CLEAR} devmon is already running."
    fi

    if [ $? -gt 0 ]; then
      stat_fail                                                                 
    else
      add_daemon devmon
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping devmon daemon"

		if [ ! -z "$PID" ]; then 
      kill $PID &> /dev/null
      rm $p_pid
		else
			echo "${C_OTHER}SKIP${C_CLEAR} devmon is not running."
    fi

		if [ $? -gt 0 ]; then
			stat_fail
    else
      rm_daemon devmon
      stat_done
		fi
    ;;
  restart)
    $0 stop
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"
esac
exit 0
