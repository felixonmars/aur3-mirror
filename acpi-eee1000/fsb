#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/acpi/eee.conf

# Exit if we're not enabled
if [ "X$ENABLE_PWRMGMT" != "XY" -a "X$ENABLE_PWRMGMT" != "Xy" ]
then
	exit 0;
fi

case "$1" in
  start)
    stat_busy "Restoring FSB Settings"
    /etc/acpi/eee/fsb.sh restore
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon fsb
      stat_done
    fi
    ;;

  stop)
    stat_busy "Saving FSB Settings"
    /etc/acpi/eee/fsb.sh save
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon fsb
      stat_done
    fi
    ;;
  *)
    echo "usage: $0 {start|stop}"
esac
