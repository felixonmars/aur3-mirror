#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
[ -f /etc/conf.d/puppet-dashboard ] && . /etc/conf.d/puppet-dashboard

DASHBOARD_HOME=${DASHBOARD_HOME:-/usr/share/puppet-dashboard}
DASHBOARD_USER=${DASHBOARD_USER:-puppet-dashboard}
DASHBOARD_RUBY=${DASHBOARD_RUBY:-/usr/bin/ruby-1.8}
DASHBOARD_ENVIRONMENT=${DASHBOARD_ENVIRONMENT:-production}
DASHBOARD_IFACE=${DASHBOARD_IFACE:-0.0.0.0}
DASHBOARD_PORT=${DASHBOARD_PORT:-3000}

get_pid() {
    [ -f /var/run/puppet-dashboard.pid ] && cat /var/run/puppet-dashboard.pid
}

PID=$(get_pid)

case "$1" in
  start)
    stat_busy "Starting Puppet Dashboard"

    if [ -z "$PID" ]; then
      [ -f /var/run/puppet-dashboard.pid ] && rm -f /var/run/puppet-dashboard.pid
      su -s /bin/sh -c "${DASHBOARD_RUBY} ${DASHBOARD_HOME}/script/server -e ${DASHBOARD_ENVIRONMENT} -p ${DASHBOARD_PORT} -b ${DASHBOARD_IFACE}" ${DASHBOARD_USER} &
      if [ $? -gt 0 ]; then
        stat_fail
        exit 1
      else
        echo $! > /var/run/puppet-dashboard.pid
        add_daemon puppet-dashboard
        stat_done
      fi
    else
      stat_fail
      exit 1
    fi
    ;;

  stop)
    stat_busy "Stopping Puppet Dashboard"
    PID=$(get_pid)
    [ ! -z "$PID" ] && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
      exit 1
    else
      rm -f /var/run/puppet-dashboard.pid &> /dev/null
      rm_daemon puppet-dashboard
      stat_done
    fi
    ;;

  restart)
    $0 stop
    sleep 5
    $0 start
    ;;

  status)
    stat_busy "Checking Puppet Dashboard status";
    ck_status puppet-dashboard
    ;;

  *)
    echo "usage: $0 {start|stop|restart|status}"
esac

exit 0
