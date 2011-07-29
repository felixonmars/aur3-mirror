#!/bin/bash
# INIT script to check whether we're on batteries, and so start with laptop 
# mode etc enabled.

# BUGS: unless we start *really* late, we have no way of throttling 
# xscreensaver, since it won't be there to command.
. /etc/rc.conf
. /etc/rc.d/functions
. /usr/share/acpi-support/power-funcs

#test -f /lib/lsb/init-functions ||exit 1
#. /lib/lsb/init-functions

test -d /var/lib/acpi-support || exit 0

shopt -s nullglob

case "$1" in
  start)
    stat_busy "Checking battery state..."
    /etc/acpi/power.sh
    # Source everything in /etc/acpi/start.d/
    for SCRIPT in /etc/acpi/start.d/*.sh; do
	. $SCRIPT
    done
    stat_done
    ;;
  stop)
    stat_busy "Disabling power management..."
    /etc/acpi/power.sh stop
    stat_done
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