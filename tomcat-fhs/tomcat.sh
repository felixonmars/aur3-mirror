#!/bin/bash
. /etc/rc.conf
. /etc/rc.d/functions

[ ! -d "$JAVA_HOME" -a -f /etc/profile.d/jdk.sh ] && . /etc/profile.d/jdk.sh
[ -r /etc/conf.d/tomcat ] && . /etc/conf.d/tomcat || exit -1

case "$1" in
	run)
		[ -f "$CATALINA_PID" ] && $0 stop
		stat_busy 'Starting Tomcat'
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
			stat_fail
			exit
		else
			[ ! -z "$CATALINA_PID" ] && echo $pid > $CATALINA_PID
			add_daemon tomcat
			stat_done
		fi
		[ "$!" != "$pid" ] && exec kill -9 $! &> /dev/null
		;;
	start)
		[ -n "$CATALINA_WORK" ] && rm -rf $CATALINA_WORK/Catalina/
		[ -n "$LOG_DIR" ] && rm -rf $LOG_DIR/*
		$0 run
		;;
	stop)
		stat_busy 'Stopping Tomcat'
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
			stat_fail
			exit
		else
			rm -f $CATALINA_PID
			rm_daemon tomcat
			stat_done
		fi
		;;
	restart)
		$0 stop && $0 start
		;;
	reload)
		$0 stop && $0 run
		;;
	*)
		echo "Usage: $0 {start|stop|restart|reload}" >&2
		exit 1
esac
#[ -z "$2" ] && echo $(date) $1ing >> $LOG_DIR/../tomcat.log
