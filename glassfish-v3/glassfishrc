#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/glassfish

case "$1" in
	start)
		stat_busy "Starting Glassfish"
			/opt/glassfish3/glassfish/bin/asadmin start-domain
		if [ $? -gt 0 ]; then
			stat_fail
		else
			add_daemon glassfish
			stat_done
		fi
	;;
	stop)
		stat_busy "Stopping Glassfish"
			/opt/glassfish3/glassfish/bin/asadmin stop-domain
		if [ $? -gt 0 ]; then
			stat_fail
		else
			rm_daemon glassfish 
			stat_done
		fi
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

