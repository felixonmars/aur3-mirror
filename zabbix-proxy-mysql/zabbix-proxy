#!/bin/bash
#
# Source function library.
. /etc/rc.conf
. /etc/rc.d/functions

# Check that networking is up.
if ck_daemon network; then
   echo "Cannot run zabbix-server without network - run network first"
   exit
fi


start () {
  stat_busy "Starting zabbix-proxy"
  /usr/sbin/zabbix_server &>/dev/null
  if [ $? -gt 0 ]; then
     stat_fail
  else
     add_daemon zabbix_proxy
     stat_done
  fi
 }

stop() {
  stat_busy "Stopping zabbix-proxy"
  killall zabbix_proxy
  if [ $? -gt 0 ]; then
     stat_fail
  else
     rm_daemon zabbix_proxy
     stat_done
  fi
  }

# See how we were called.
case $1 in	
  start)
   start
   ;;
  stop)
   stop
   ;;
  restart)
   stop
   start
   ;;
  *)
  echo $"Usage: zabbix-proxy {start|stop|restart}"
  exit 1
 esac

exit $RETVAL
