#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
  start)
    stat_busy "Switching on zram-based swap"
    /usr/lib/systemd/scripts/zramctrl start >/dev/null
    stat_done
  ;;
  stop)
    stat_busy "Switching off zram-based swap"
    /usr/lib/systemd/scripts/zramctrl stop >/dev/null
    stat_done
  ;;
  *)
      echo "usage: $0 {start|stop}"
esac

exit 0
