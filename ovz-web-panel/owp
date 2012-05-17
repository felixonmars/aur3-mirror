#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

ruby='ruby-1.8'
daemon_name=owp
LOG="/var/log/owp/owp.log"
INSTALL_DIR='/usr/share/webapps/ovz-web-panel'
daemon_conf='/etc/conf.d/owp.conf'
#fi

# default options, you can edit the /etc/webapps/ovz-web-panel/owp.conf
PORT=3000
IP=0.0.0.0
SSL=off
LOCK_FILE='/var/lock/owp.lock'

if [ -f $daemon_conf ]; then
    . $daemon_conf
else
    stat_fail "File $daemon_conf isn't readable"
fi

check_environment() {
  if [ -f /proc/vz/version ]; then
    ENVIRONMENT="HW-NODE"
  else
    ENVIRONMENT="STANDALONE"
  fi
}

start() {
  if [ -f $LOCK_FILE ]; then
    stat_fail "OpenVZ Web Panel is already running!"
  else
    stat_busy  "Starting OpenVZ Web Panel Server"
    $ruby $INSTALL_DIR/utils/watchdog/watchdog.rb start &>>$LOG
    if [ "x$SSL" = "xon" ]; then
      $ruby $INSTALL_DIR/script/server_ssl webrick -e production -p $PORT -b $IP -d &>>$LOG
    else
      $ruby $INSTALL_DIR/script/server webrick -e production -p $PORT -b $IP -d &>>$LOG
    fi
    [ "$ENVIRONMENT" = "HW-NODE" ] && $ruby $INSTALL_DIR/utils/hw-daemon/hw-daemon.rb start &>>$LOG && \
	    touch $LOCK_FILE
    sleep 1 # wait a little for forked processes
    echo "Syncing physical servers state..." &>>$LOG
    $ruby $INSTALL_DIR/script/runner -e production "HardwareServer.all.each { |server| server.sync }" &>>$LOG
	if [ -f $LOCK_FILE ]; then
		add_daemon $daemon_name
		stat_done
	else
		stat_fail
        exit 1
	fi
  fi
}

stop() {
  stat_busy "Stopping OpenVZ Web Panel server"
  PANEL_APP_PID=`ps auxww | grep $ruby | grep script/server | awk '{ print $2 }'`
  [ -n "$PANEL_APP_PID" ] && kill -2 $PANEL_APP_PID
  [ "$ENVIRONMENT" = "HW-NODE" ] && $ruby $INSTALL_DIR/utils/hw-daemon/hw-daemon.rb stop &>>$LOG && \
	  $ruby $INSTALL_DIR/utils/watchdog/watchdog.rb stop &>>$LOG && \
	  rm -f $LOCK_FILE
  if [ ! -f $LOCK_FILE ]; then
	  rm_daemon $daemon_name
	  stat_done
  else
	  stat_fail
  fi
}

status() {
  $ruby $INSTALL_DIR/utils/watchdog/watchdog.rb status
  
  if [ -f $LOCK_FILE ]; then
    echo "OpenVZ Web Panel is running!"
    exit 0
  else
    echo "OpenVZ Web Panel is NOT running!"
    exit 1
  fi
}

# main()
check_environment
case "$1" in
  start)
    start
    ;;
  stop)
    stop
    ;;
  status)
    status 
    ;;
  restart|reload|condrestart)
    stop
    start
    ;;
  *)
    echo $"Usage: $0 {start|stop|restart|reload|status}"
    exit 1
esac

exit 0
