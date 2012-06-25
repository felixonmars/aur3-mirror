#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

# source application-specific settings
[ -f /etc/conf.d/wanproxy ] && . /etc/conf.d/wanproxy

PID=`pidof -o %PPID /usr/bin/wanproxy`
case "$1" in
  start)
    stat_busy "Starting WANproxy Daemon"
		[ -z "$PID" ] && (/usr/bin/wanproxy -c ${WANPROXY_CONF} ${WANPROXY_ARGS} &) &>/dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon wanproxy
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping WANproxy Daemon"
    [ ! -z "$PID" ] && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon wanproxy
      stat_done
    fi
    ;;
  restart)
    $0 stop
    sleep 3
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"
esac
exit 0
# vim: ft=sh ts=2 sw=2
