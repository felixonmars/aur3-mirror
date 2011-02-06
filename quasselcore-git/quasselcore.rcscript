#!/bin/bash 
. /etc/rc.conf 
. /etc/rc.d/functions 

QUASSELCORE_USER="quassel"
QUASSELCORE_ARGS="-c /home/$QUASSELCORE_USER/.config/quassel-irc.org/"
PID=`pidof -o %PPID /usr/bin/quasselcore`

case "$1" in
  start)
    stat_busy "Starting Quassel core"
    [ -z "$PID" ] && sudo -u $QUASSELCORE_USER /usr/bin/quasselcore $QUASSELCORE_ARGS &>/dev/null &
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon quasselcore
      stat_done
    fi
  ;;
  stop)
    stat_busy "Stopping Quassel core"
    [ ! -z "$PID" ] && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon quasselcore
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
