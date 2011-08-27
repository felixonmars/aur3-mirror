#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

. /etc/conf.d/zeitgeist-userspace.conf


#PID=`pidof -x -o %PPID $ZEITGEIST_PATH`
PID=`ps ax | grep '/usr/bin/python2 /usr/bin/zeitgeist-daemon' | grep -v grep | awk '{print $1}'`

case "$1" in
  start)
    stat_busy "Starting Zeitgeist Daemon"
    if [ $USER = 'yourusername' ]; then
        echo "Please edit /etc/conf.d/zeitgeist-userspace.conf before using this script."
        stat_fail
    else
	LANG=$LOCALE
        [ -z "$PID" ] && su -c "$ZEITGEIST_PATH 2>/dev/null &" $USER
        if [ $? -gt 0 ]; then
          stat_fail
        else
          add_daemon zeitgeist-userspace
          stat_done
        fi
    fi
    ;;
  stop)
    stat_busy "Stopping Zeitgeist Daemon"
    [ ! -z "$PID" ] && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon zeitgeist-userspace
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
    ;;
esac
exit 0

