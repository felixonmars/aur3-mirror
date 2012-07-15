#!/bin/bash

. /etc/conf.d/plexmediaserver

export PLEX_MEDIA_SERVER_HOME=/usr/lib/plexmediaserver
export LD_LIBRARY_PATH="${PLEX_MEDIA_SERVER_HOME}"
export TMPDIR="${PLEX_MEDIA_SERVER_TMPDIR}"

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/lib/plexmediaserver/Plex\ Media\ Server`

case "$1" in
  start)
    stat_busy "Starting Plex Media Server"
    [ -z "$PID" ] && su -c " /usr/lib/plexmediaserver/Plex\ Media\ Server 2>&1 >> /var/log/plexmediaserver.log &" $PLEX_MEDIA_SERVER_USER
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon plexmediaserver
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping Plex Media Server"
    [ ! -z "$PID" ] && kill $PID > /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      sleep 3
      if [ -n "$(pidof -o %PPID /usr/lib/plexmediaserver/Plex\ Media\ Server)" ]; then
        stat_fail
      else
        rm_daemon plexmediaserver
        stat_done
      fi
    fi
    ;;
  restart)
    $0 stop
    sleep 3
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"
    ;; esac
exit 0
