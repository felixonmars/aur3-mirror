#!/bin/bash
#
# red5:         Red5 Server
#
# chkconfig:    2345 70 30
# description:  Open-Source Flash Server
# config:       /etc/sysconfig/red5

. /etc/init.d/functions

[ -f /etc/sysconfig/red5 ] && . /etc/sysconfig/red5

[ -z "$RED5_HOME" ] && RED5_HOME=/opt/red5
[ ! -d "$RED5_HOME" ] && exit -1
[ ! -d "$RED5_CONF_DIR" ] && RED5_CONF_DIR="$RED5_HOME/conf"
[ ! -d "$RED5_WORK_DIR" ] && RED5_WORK_DIR="$RED5_HOME/work"
[ ! -d "$RED5_LOG_DIR" ] && RED5_LOG_DIR="$RED5_HOME/log"
[ -z "$RED5_OUT" ] && RED5_OUT=/dev/null
[ ! -d "$STARTUP_DIR" ] && STARTUP_DIR="$RED5_HOME"

RED5_CLASSPATH="$RED5_HOME/boot.jar:$RED5_CONF_DIR"
export RED5_HOME

case "$1" in
	run)
		[ -f "$RED5_PID" ] && $0 stop
		echo -n 'Starting Red5: '
		cd "$STARTUP_DIR"
		RED5_OPTS="$LOGGING_OPTS $SECURITY_OPTS -Dpython.home=lib -Dred5.root=$RED5_HOME -Dred5.config_root=$RED5_CONF_DIR"
		RED5_MAINCLASS='org.red5.server.Bootstrap'
		if [ ! -z "$RED5_USER" -a "$USER" != "$RED5_USER" ]; then
			su $RED5_USER -c "exec $JAVA_HOME/bin/java $JAVA_OPTS \
				$RED5_OPTS -cp $RED5_CLASSPATH $RED5_MAINCLASS \
				 >> $RED5_OUT 2>&1" &
			for i in $(seq 5); do
				pid=$(ps -o ppid,pid -U $RED5_USER | awk "{if(\$1==$!)print\$2}")
				[ -n "$pid" ] && break
				sleep $i
			done
		else
			$JAVA_HOME/bin/java $JAVA_OPTS \
				$RED5_OPTS -cp $RED5_CLASSPATH $RED5_MAINCLASS \
				>> $RED5_OUT 2>&1 &
			pid=$!
		fi
		if [ -z "$pid" -o ! -e "/proc/$pid" ]; then
			failure; echo
			exit
		else
			[ ! -z "$RED5_PID" ] && echo $pid > $RED5_PID
			touch /var/lock/subsys/red5 && success || failure; echo
		fi
		[ "$!" != "$pid" ] && exec kill -9 $! &> /dev/null
		;;
	start)
		rm -rf $RED5_WORK_DIR/red5*
		: > $RED5_OUT
		rm -f $RED5_LOG_DIR/*
		$0 run
		;;
	stop)
		echo -n 'Stopping Red5: '
		cd "$STARTUP_DIR"
		RED5_MAINCLASS='org.red5.server.Shutdown'
		if [ ! -z "$RED5_USER" -a "$USER" != "$RED5_USER" ]; then
			su $RED5_USER -c "exec $JAVA_HOME/bin/java $JAVA_OPTS $JMX_OPTS \
				$RED5_OPTS -cp $RED5_CLASSPATH $RED5_MAINCLASS $SHUTDOWN_OPTS \
				 >> $RED5_OUT 2>&1" &
		else
			$JAVA_HOME/bin/java $JAVA_OPTS $JMX_OPTS \
				$RED5_OPTS -cp $RED5_CLASSPATH $RED5_MAINCLASS $SHUTDOWN_OPTS \
				>> $RED5_OUT 2>&1 &
		fi
		for i in $(seq 5); do
			[ -e "/proc/$!" ] || break
			sleep $i
		done
		[ -e "/proc/$!" ] && kill $! 2> /dev/null && \
			sleep 1 && kill -9 $! 2> /dev/null
		[ -f "$RED5_PID" ] && pid=$(<$RED5_PID) && kill $pid 2> /dev/null && \
			sleep 1 && kill -9 $pid 2> /dev/null && sleep 1
		if [ -z "$pid" -o $? -eq 0 -a -e "/proc/$pid" ]; then
			failure; echo
			exit
		else
			rm -f $RED5_PID
			rm -f /var/lock/subsys/red5 && success || failure; echo
		fi
		;;
	restart)
		$0 stop && $0 start
		;;
	reload)
		$0 stop && $0 run
		;;
	status)
		;;
	*)
		echo "Usage: $0 {start|stop|restart|reload}" >&2
		exit 1
esac
