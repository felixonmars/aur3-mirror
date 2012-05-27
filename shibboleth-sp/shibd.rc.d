#! /bin/bash

### /etc/rc.d/shibd: Initscript for Shibboleth

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/sbin/shibd`
case "$1" in
  start)
    stat_busy "Starting Shibboleth SP"
    [ -z "$PID" ] && \
      /usr/sbin/shibd &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else stat_done; add_daemon shibd
      echo $PID > /var/run/shibd.pid
    fi ;;
  stop)
    stat_busy "Stopping Shibboleth SP"
    [ ! -z "$PID" ] \
      && kill $PID &>/dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      stat_done; rm_daemon shibd
    fi ;;
  restart)
    $0 stop
    sleep 1
    $0 start ;;
  *)
    echo "usage: $0 {start|stop|restart}"
esac

exit 0

### /etc/rc.d/shibd: Initscript for Shibboleth
