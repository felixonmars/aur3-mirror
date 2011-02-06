#!/bin/bash
#
# tomcat:       Tomcat Server
#
# chkconfig:    2345 70 30
# description:  Apache Tomcat 6 Server
# config:       /etc/sysconfig/tomcat

. /etc/init.d/functions

[ -f /etc/sysconfig/tomcat ] && . /etc/sysconfig/tomcat || exit -1

[ ! -d "$JAVA_HOME" ] && exit -1

case "$1" in
	run)
		[ -f "$CATALINA_PID" ] && $0 stop
		echo -n 'Starting Tomcat: '
		[ -d "$STARTUP_DIR" ] && cd "$STARTUP_DIR"
		CATALINA_PARAMS="-Dcatalina.home=$CATALINA_HOME \
			-Dcatalina.base=$CATALINA_BASE \
			-Djava.io.tmpdir=$CATALINA_TMPDIR \
			$CATALINA_OPTS $SECURITY_OPTS $JAVA_OPTS \
			-cp $CATALINA_HOME/bin/bootstrap.jar \
			org.apache.catalina.startup.Bootstrap \
			start"
		if [ ! -z "$CATALINA_USER" -a "$USER" != "$CATALINA_USER" ]; then
			su $CATALINA_USER -c "exec $JAVA_HOME/bin/java \
				$CATALINA_PARAMS \
				 >> $LOG_DIR/catalina.log 2>&1" &
			for i in $(seq 5); do
				pid=$(ps -o ppid,pid -U $CATALINA_USER | awk "{if(\$1==${!})print\$2}")
				[ -n "$pid" ] && break
				sleep $i
			done
		else
			$JAVA_HOME/bin/java \
				$CATALINA_PARAMS \
				>> $LOG_DIR/catalina.log 2>&1 &
			pid=$!
		fi
		if [ -z "$pid" -o ! -e "/proc/$pid" ]; then
			failure; echo
			exit
		else
			[ ! -z "$CATALINA_PID" ] && echo $pid > $CATALINA_PID
			touch /var/lock/subsys/tomcat && success || failure; echo
		fi
		[ "$!" != "$pid" ] && exec kill -9 $! &> /dev/null
		;;
	start)
		[ -n "$CATALINA_WORK" ] && rm -rf $CATALINA_WORK/Catalina/
		[ -n "$LOG_DIR" ] && rm -rf $LOG_DIR/*
		$0 run
		;;
	stop)
		echo -n 'Stopping Tomcat: '
		CATALINA_PARAMS="-Dcatalina.home=$CATALINA_HOME \
			-Dcatalina.base=$CATALINA_BASE \
			-Djava.io.tmpdir=$CATALINA_TMPDIR \
			$CATALINA_OPTS \
			-cp $CATALINA_HOME/bin/bootstrap.jar \
			org.apache.catalina.startup.Bootstrap \
			stop"
		if [ ! -z "$CATALINA_USER" -a "$USER" != "$CATALINA_USER" ]; then
			su $CATALINA_USER -c "exec $JAVA_HOME/bin/java \
				$CATALINA_PARAMS \
				 >> $LOG_DIR/catalina.log 2>&1" &
		else
			$JAVA_HOME/bin/java \
				$CATALINA_PARAMS \
			 	>> $LOG_DIR/catalina.log 2>&1 &
		fi
		for i in $(seq 5); do
			[ -e "/proc/$!" ] || break
			sleep $i
		done
		[ -e "/proc/$!" ] && kill $! 2> /dev/null && \
			sleep 1 && kill -9 $! 2> /dev/null
		[ -f "$CATALINA_PID" ] && pid=$(<$CATALINA_PID) && kill $pid 2> /dev/null && \
			sleep 1 && kill -9 $pid 2> /dev/null && sleep 1
		if [ -z "$pid" -o $? -eq 0 -a -e "/proc/$pid" ]; then
			failure; echo
			exit
		else
			rm -f $CATALINA_PID
			rm -f /var/lock/subsys/tomcat && success || failure; echo
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
