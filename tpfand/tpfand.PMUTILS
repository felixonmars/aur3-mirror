#!/bin/sh

# stop tpfand during suspend
case "$1" in
  hibernate|suspend)
    /etc/rc.d/tpfand stop
  ;;
  thaw|resume)
    /etc/rc.d/tpfand start
  ;;
  *) exit $NA
  ;;
esac

