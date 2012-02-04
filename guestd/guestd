#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

OLD_IFS="$IFS"
IFS=$'\n'
KEEP=`cat /home/guest-permanent/.keep`

case "$1" in
  start)
    stat_busy "Fixing Guest Directory"
    cp -R /home/guest-permanent -T /home/guest
    chown -R guest:guest /home/guest /home/guest-permanent
    chmod -R 770 /home/guest
    chmod -R 550 /home/guest-permanent
    stat_done
    add_daemon guestd
    ;;
  stop)
    stat_busy "Removing Guest Directory"
    if [ -d /home/guest ]; then
      for keeping in ${KEEP[@]}; do
      	if [ -e /home/guest/$keeping ]; then
	        cp -rf /home/guest/$keeping -T /home/guest-permanent/$keeping
	      fi
      done
      rm -rf /home/guest
      stat_done
      rm_daemon guestd
    else
      echo "Failed to remove directory; directory does not exist."
      stat_fail
      rm_daemon guestd
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
