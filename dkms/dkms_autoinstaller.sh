#!/bin/bash

test -f /usr/sbin/dkms || exit 0

if [ -f /lib/lsb/init-functions ]; then
    . /lib/lsb/init-functions
fi

. /etc/rc.conf
. /etc/rc.d/functions

log_end_msg() { if [ "$1" = "0" ]; then stat_done; else stat_fail; fi }

if [ -n "$2" ]; then
    kernel="$2"
else
    kernel=`uname -r`
fi

case "$1" in
  start)
    stat_busy "Service auto-install/update modules for kernel $kernel" "dkms"
    dkms autoinstall --kernelver $kernel
    log_end_msg $?
    ;;
  stop|restart|force-reload|status|reload)
    ;;
  *)
    echo "Usage: $0 {start}"
esac

exit 0
