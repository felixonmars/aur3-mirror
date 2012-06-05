#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/sickbeard

case "$1" in
  start)
    stat_busy "Starting Sick Beard"

    if [ -f /var/run/daemons/sickbeard ]; then
      echo -n "Sick Beard is already running as a daemon! If you are certain it is not running, remove /var/run/daemons/sickbeard."
      stat_fail
    else
      SB_ARGS="-q -d"

      if [ "$SB_DATA" ]; then
        SB_ARGS+=" --data \"$SB_DATA\""
      fi

      if [ "$SB_CONF" ]; then
        SB_ARGS+=" --config \"$SB_CONF\""
      fi

      if [ ! "$SB_USER" ]; then
        /usr/bin/sickbeard $SB_ARGS
        RC=$?
      else
        su - $SB_USER -c "/usr/bin/sickbeard $SB_ARGS" -s /bin/sh
        RC=$?
      fi

      if [ $RC -gt 0 ]; then
        stat_fail
      else
        add_daemon sickbeard
        stat_done
      fi
    fi
    ;;
  stop)
    stat_busy "Stopping Sick Beard"

    SB_PORT=$(grep -i web_port "$SB_CONF" | sed -e 's/.*=\s*//')
    SB_PROTOCOL=$(grep -i 'enable_https\s*=\s*1' "$SB_CONF")
    SB_WEBROOT=$(grep -i web_root "$SB_CONF" | sed -e 's/.*=\s*//' -e 's/"//g')
    SB_USERNAME=$(grep -i web_username "$SB_CONF" | sed -e 's/.*=\s*//' -e 's/"//g')
    SB_PASSWORD=$(grep -i web_password "$SB_CONF" | sed -e 's/.*=\s*//' -e 's/"//g')

    if [ "$SB_PROTOCOL" ]; then
      SB_URL="https://"
    else
      SB_URL="http://"
    fi

    if [ "$SB_USERNAME" ]; then
      SB_URL+="$SB_USERNAME"

      if [ "$SB_PASSWORD" ]; then
        SB_URL+=":$SB_PASSWORD"
      fi

      SB_URL+="@"
    fi

    SB_URL+="localhost:$SB_PORT/$SB_WEBROOT/home/shutdown/"

    wget -q --delete-after --no-check-certificate "$SB_URL" &>/dev/null

    if [ $? -gt 0 ]; then
      echo "The shutdown failed. Check that Sick Beard is actually running and that the proper values are in /etc/conf.d/sickbeard."
      echo "You may also have issues if you haven't restarted Sick Beard after changing something like the web protocol."
      stat_fail
    else
      rm_daemon sickbeard
      stat_done
    fi
    ;;
  restart)
    "$0" stop
    sleep 1
    "$0" start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"
esac
exit 0

