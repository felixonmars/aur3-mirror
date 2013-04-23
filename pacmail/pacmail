#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

start() {
	stat_busy "Starting PacMail"
	/usr/bin/pacmail start
	stat_done
}

stop() {
	stat_busy "Shutting down PacMail"
	/usr/bin/pacmail stop
	stat_done
}

case "$1" in
  start)
	start
	;;
  stop)
	stop
	;;
  restart)
	stop
	start
	;;
  *)
	echo $"Usage: $0 {start|stop|restart}"
	;;
esac
exit 0

