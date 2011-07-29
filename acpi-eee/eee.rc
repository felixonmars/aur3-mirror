#!/bin/bash

DESC="Asus EeePC startup configuration"

USER=""

if [ "$(whoami)" != "root" ];then
 echo "You must be root to start/restart/stop services."
 exit 1
fi

. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
  start)
    stat_busy "Starting $DESC"
	add_daemon eee
 	rm -f /etc/acpi/power.lock
	/etc/acpi/powersource.sh > /dev/null
        stat_done
    ;;
  stop)
    stat_busy "Stopping $DESC"
	rm_daemon eee
	rm -f /etc/acpi/power.lock
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
