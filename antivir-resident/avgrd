#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

AV_STAT=$(/usr/lib/AntiVir/avguard status)
AV_NUM=$(echo "$AV_STAT" | awk '{print $6}')
AV_DAZ=$(echo "$AV_STAT" | grep 'Dazuko unav')
C_RUNNING="\033[1;32;40m"

case "$1" in
  start)
    stat_busy "Starting AntiVir Guard"
    [ -z "$AV_DAZ" ] && [ "$AV_NUM" = "0" ] && \
      /usr/lib/AntiVir/avguard start &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon avgrd
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping AntiVir Guard"
    [ "$AV_NUM" != "0" ] && /usr/lib/AntiVir/avguard stop &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon avgrd
      stat_done
    fi
    ;;
  status)
    printf "${C_OTHER}:: ${C_MAIN}Probing AntiVir Guard... "
    [ "$AV_NUM" != "0" ] printf "${C_RUNNING}$AV_NUM " || printf "${C_FAIL}no "
    printf "daemons running${C_CLEAR}"
    stat_done
    ;;
  restart)
    $0 stop
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|status|restart}"
esac
exit 0
