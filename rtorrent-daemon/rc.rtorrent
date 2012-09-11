#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/rtorrent

case "$1" in
  start)
    for USER in ${USERS[@]} ; do
      su $USER -c "~/etc/rc.d/rtorrent start"
    done

    add_daemon rtorrent
    ;;
  stop)
    for USER in ${USERS[@]}; do
      su $USER -c "~/etc/rc.d/rtorrent stop"
    done

    rm_daemon rtorrent
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

# vim:set ts=2 sw=2 ft=sh et:
