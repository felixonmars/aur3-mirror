#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/inetutils-syslogd

PID=`pidof -o %PPID /usr/sbin/syslogd`
case "$1" in
  start)
    stat_busy "Starting inetutils-syslogd"
    [ -z "$PID" ] && /usr/sbin/syslogd $INETUTILS_SYSLOGD_ARGS
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon inetutils-syslogd
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping inetutils-syslogd"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm -f /var/run/inetutils-syslogd.pid
      rm -f /var/inetutils-syslogd.persist
      rm_daemon inetutils-syslogd
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
esac
exit 0
