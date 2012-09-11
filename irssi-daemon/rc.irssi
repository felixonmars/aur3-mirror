#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/irssi

case "$1" in
  start)
    for USER in ${USERS[@]} ; do
      su $USER -c "~/etc/rc.d/irssi start"
    done

    add_daemon irssi
    ;;
  stop)
    for USER in ${USERS[@]} ; do
      su $USER -c "~/etc/rc.d/irssi stop"
    done

    rm_daemon irssi
    ;;
  restart)
    $0 stop
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"
esac
exit 0

# vim:set ts=2 sw=2 ft=sh et:
