#!/bin/bash

# general config
. /etc/rc.conf
. /etc/rc.d/functions

# set JAVA_HOME
[ -f /etc/profile.d/jre.sh ] && . /etc/profile.d/jre.sh
[ -f /etc/profile.d/jdk.sh ] && . /etc/profile.d/jdk.sh
[ -f /etc/profile.d/openjdk6.sh ] && . /etc/profile.d/openjdk6.sh

case "$1" in
  start)
    stat_busy "Starting ROLE"
      cd /opt/role/db
      su role -c "cd /opt/role/db && $JAVA_HOME/bin/java -Djetty.host=127.0.0.1 -Djetty.port=8073 -jar /opt/role/webapps/jetty-runner.jar --port 8073 /opt/role/webapps/role-uu-prototype.war --path /cam /opt/role/webapps/CamWebService.war --path /role /opt/role/ >> /var/log/role.log 2>&1" -s /bin/sh > /dev/null 2>&1 &
      sleep 5
      kill $!
      sleep 5
      echo `ps -fu role | awk 'NR != 1 {print $2}'` > /var/run/role.pid
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon role
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping ROLE"
    cd /opt/role/db
    [ -e /var/run/role.pid ] && PID=`cat /var/run/role.pid`
    [ ! -z "$PID" ] && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon role
      rm -f /var/run/role.pid
      stat_done
    fi
    ;;
  restart)
    $0 stop
    sleep 3
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"  
esac
