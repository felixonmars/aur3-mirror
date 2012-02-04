#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

. /etc/conf.d/dropboxd-userspace.conf


PID=`pidof -o %PPID $DROPBOX_PATH`

case "$1" in
  start)
    stat_busy "Starting Dropbox Service"
    if [ $USER = 'yourusername' ]; then
        echo "Please edit /etc/conf.d/dropboxd-userspace.conf before using this script."
        stat_fail
    else
	LANG=$LOCALE
        [ -z "$PID" ] && su -c "$DROPBOXD_PATH &" $USER
        if [ $? -gt 0 ]; then
          stat_fail
        else
          add_daemon dropboxd-userspace
          stat_done
        fi
    fi
    ;;
  stop)
    stat_busy "Stopping Dropbox Service"
    [ ! -z "$PID" ] && kill $PID > /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon dropboxd-userspace
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

