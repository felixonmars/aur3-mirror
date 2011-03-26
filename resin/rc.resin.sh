#!/bin/bash
. /etc/rc.conf
. /etc/rc.d/functions

[ ! -d "$JAVA_HOME" -a -f /etc/profile.d/jdk.sh ] && . /etc/profile.d/jdk.sh
[ -r /etc/conf.d/resin ] && . /etc/conf.d/resin || exit -1

JAVA_PARAMS="-jar $RESIN_HOME/lib/resin.jar -resin-home $RESIN_HOME"

case "$1" in
	start)
		stat_busy 'Starting Resin'
		[ -d "$STARTUP_DIR" ] && cd "$STARTUP_DIR"
		COMMAND="$JAVA_HOME/bin/java $JAVA_PARAMS start"
		if [ ! -z "$RESIN_USER" -a "$USER" != "$RESIN_USER" ]; then
			su $RESIN_USER -c "exec $COMMAND &>/dev/null"
		else
			$COMMAND &>/dev/null
		fi
		if [ $? -ne 0 ]; then
			stat_fail
			exit
		else
			add_daemon resin
			stat_done
		fi
		;;
	stop)
		stat_busy 'Stopping Resin'
		COMMAND="$JAVA_HOME/bin/java $JAVA_PARAMS stop"
		if [ ! -z "$RESIN_USER" -a "$USER" != "$RESIN_USER" ]; then
			su $RESIN_USER -c "exec $COMMAND &>/dev/null"
		else
			$COMMAND &>/dev/null
		fi
		if [ $? -ne 0 ]; then
			stat_fail
			exit
		else
			rm_daemon resin
			stat_done
		fi
		;;
	restart)
		$0 stop && $0 start
		;;
	*)
		echo "Usage: $0 {start|stop|restart}" >&2
		exit 1
esac
