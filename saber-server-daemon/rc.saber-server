#!/bin/bash

. /etc/conf.d/saber-server
. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
  start)
		for USER in ${USERS[@]}; do
			su $USER -c "~/etc/rc.d/saber-server start"
		done

		add_daemon saber-server
    ;;
  stop)
		for USER in ${USERS[@]}; do
			su $USER -c "~/etc/rc.d/saber-server stop"
		done

		rm_daemon saber-server
		;;
	restart)
		$0 stop
		$0 start
		;;
	*)
		echo "usage: $0 {start|stop|restart}"
		;;
esac
exit 0
