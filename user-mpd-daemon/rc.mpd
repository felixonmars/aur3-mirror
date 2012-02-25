#!/bin/bash

. ~/etc/rc.conf
. ~/etc/rc.d/functions

p_conf="$HOME/.mpd/mpd.conf"
p_daemon_log="$HOME/var/log/mpd.daemon.log"

case "$1" in
  start)
    stat_busy "Starting Music Player Daemon"

    /usr/bin/mpd $p_conf &> $p_daemon_log

    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon mpd
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping Music Player Daemon"

    /usr/bin/mpd --kill $p_conf &> /dev/null

    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon mpd
      stat_done
    fi
    ;;
  restart)
    $0 stop
    sleep 1
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"
		;;
esac
exit 0
