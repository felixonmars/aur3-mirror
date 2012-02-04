#!/bin/bash

daemon="TOMOYO"

. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
  start)
    stat_busy "Starting $daemon subsystem"
    /sbin/tomoyo-init > /dev/null

    if [ $? -gt 0 ]; then
      stat_fail
      exit 1
    else
      stat_done
    fi
    ;;
  stop)
    stat_done "Stopping $daemon subsystem"
    /usr/sbin/tomoyo-savepolicy
    if [ $? -gt 0 ]; then
      stat_fail
      exit 1
    else
      stat_done
    fi
    ;;
  save)
    /usr/sbin/tomoyo-savepolicy
    if [ $? -gt 0 ]; then
      stat_fail
      exit 1
    else
      stat_done
    fi
    ;;
  *)
    echo "usage: $0 {start|stop|save}"
esac

exit 0
