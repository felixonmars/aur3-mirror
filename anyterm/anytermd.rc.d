#! /bin/bash

### /etc/rc.d/anytermd: Initscript for Anyterm

. /etc/conf.d/anytermd

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/sbin/anytermd`
case "$1" in
  start)
    stat_busy "Starting Anyterm Daemon"
    [ -z "$PID" ] && /usr/sbin/anytermd \
      $ANYTERMD_OPTIONS \
      -c "$ANYTERMD_COMMAND" &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else stat_done; add_daemon anytermd
      echo $PID > /var/run/anytermd.pid
    fi ;;
  stop)
    stat_busy "Stopping Anyterm Daemon"
    [ ! -z "$PID" ] \
      && kill $PID &>/dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      stat_done; rm_daemon anytermd; fi ;;
  restart)
    $0 stop
    sleep 1
    $0 start ;;
  *)
    echo "usage: $0 {start|stop|restart}"
esac

exit 0

### /etc/rc.d/anytermd: Initscript for Anyterm
