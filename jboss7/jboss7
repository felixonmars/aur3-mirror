#!/bin/bash

DAEMON_NAME=jboss7

. /etc/rc.conf
. /etc/rc.d/functions
#. /etc/profile.d/jdk.sh
. /etc/profile.d/jboss7.sh

export LOG_FILE=/dev/null
#export LOG_FILE=$JBOSS_HOME/${JBOSS_MODE}/log/daemon.log

# check if $JBOSS_USER exists
su $JBOSS_USER -s /bin/sh -c /bin/true > ${LOG_FILE} 2>&1 
if [ $? -ne 0 -o -z "$JBOSS_USER" ]; then
  JBOSS_USER="$(whoami)"
fi

if [ "${JBOSS_USER}" == "root" ]; then
  JBOSS_PIDFILE=/var/log/${DAEMON_NAME}.pid
else
  JBOSS_PIDFILE=${JBOSS_HOME}/${JBOSS_MODE}/${DAEMON_NAME}.pid
fi

export JBOSS_PIDFILE

case "$1" in
  start)
    if [ ! -e ${JBOSS_PIDFILE} ]; then
      stat_busy "Starting JBoss AS 7 as $JBOSS_USER in ${JBOSS_MODE} mode"
      START_CMD="${JBOSS_HOME}/bin/${JBOSS_MODE}.sh &> ${LOG_FILE}"
      su $JBOSS_USER -c "( $START_CMD )" &
      sleep 3
      if [ -z "`ps -ef | grep java | grep org.jboss.as.`" ]; then
          kill `cat ${JBOSS_PIDFILE}` &> ${LOG_FILE}
          rm -f ${JBOSS_PIDFILE}
          stat_fail
          exit 1
      else
        add_daemon ${DAEMON_NAME}
        stat_done
      fi
    else
      stat_busy "pidfile for ${DAEMON_NAME} already exists"
      stat_fail
      exit 1
    fi
    ;;
  stop)
    stat_busy "Stopping JBoss Application Server 7"
    kill `cat ${JBOSS_PIDFILE} 2> ${LOG_FILE}` >& ${LOG_FILE}
    if [ $? -gt 0 ]; then
      stat_fail
      exit 1
    else
      rm_daemon ${DAEMON_NAME}
      su $JBOSS_USER -c "rm -f ${JBOSS_PIDFILE}"
      stat_done
    fi
    ;;
  restart)
    $0 stop
    sleep 10
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"  
esac
