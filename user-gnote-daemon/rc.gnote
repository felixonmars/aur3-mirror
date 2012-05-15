#!/bin/bash

. ~/etc/rc.conf
. ~/etc/rc.d/functions

p_pid="$HOME/var/run/foo.pid"
p_log="$HOME/var/log/gnote.log"

[[ -f $p_pid ]] && PID=$(cat $p_pid)
[[ -d /proc/$PID ]] || PID=""

case "$1" in
  start)
    stat_busy "Starting gnote daemon"

    if [[ -z "$PID" ]]; then
			/usr/bin/gnote watch -V &>$p_log &
      echo $! > $p_pid
		else
			echo "${C_OTHER}SKIP${C_CLEAR} gnote is already running."
    fi

    if [[ $? -gt 0 ]]; then
      stat_fail                                                                 
    else
      add_daemon gnote
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping gnote daemon"

		if [[ -n "$PID" ]]; then 
      kill $PID &> /dev/null
      rm $p_pid
		else
			echo "${C_OTHER}SKIP${C_CLEAR} gnote is not running."
    fi

		if [[ $? -gt 0 ]]; then
			stat_fail
    else
      rm_daemon gnote
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
