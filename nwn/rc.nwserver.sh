#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

NWSERVER_SAVE_SLOT=2
NWSERVER_SAVE_NAME=shutdown
NWSERVER_SAVE_TIMEOUT=10
NWSERVER_ARGS=""

. /etc/conf.d/nwserver

_daemonName="Neverwinter Nights server"
_logDir="/var/log/nwserver"
_runDir="/run/nwserver"
_srvDir="/srv/nwn"
_expectScript=$(cat << EOS
set timeout "$NWSERVER_SAVE_TIMEOUT"

proc exitServer {} {
  send "exit\r"
  expect "Server: Exiting..." {return 0}
  return 1
}

spawn attachtty "$_runDir/socket"
send "forcesave $NWSERVER_SAVE_SLOT $NWSERVER_SAVE_NAME\r"
expect {
  "Server: Save complete" {
    exit [exitServer]
  }
  default {
    exit [exitServer]
  }
}
EOS
)

case "$1" in
  start)
    stat_busy "Starting $_daemonName"
    if [[ ! -f "$_runDir/server.pid" ]]; then
      cd "$_srvDir"
      if [[ ! -d "$_runDir" ]]; then
        mkdir -p "$_runDir"
        chown nwserver:nwserver "$_runDir"
      fi
      su nwserver -c "RW_BRANCH=$_srvDir detachtty --dribble-file $_logDir/server_stdout.log  \
                                                   --log-file $_logDir/detachtty.log          \
                                                   --pid-file $_runDir/server.pid             \
                                                   $_runDir/socket /usr/bin/nwserver $NWSERVER_ARGS -interactive" &&
      chmod 770 "$_runDir/socket" &&
      chmod 644 "$_runDir/server.pid" &&
      chown nwserver:log "$_logDir/server_stdout.log" &&
      chown nwserver:log "$_logDir/detachtty.log" &&
      chmod 640 "$_logDir/server_stdout.log" &&
      chmod 640 "$_logDir/detachtty.log" &&
      add_daemon nwserver &&
      stat_done || stat_fail
    else
      stat_fail
    fi
    ;;
  stop)
    stat_busy "Stopping $_daemonName"
    if [[ ! -f "$_runDir/server.pid" ]]; then
      # nwserver died
      rm_daemon nwserver
      stat_fail
    else
      if [[ -S "$_runDir/socket" ]]; then
        echo "$_expectScript" | expect - &> /dev/null &&
        # nwserver stopped
        rm_daemon nwserver &&
        stat_done ||
        # nwserver didn't stop
        stat_fail
      else
        # nwserver died
        rm_daemon nwserver
        stat_fail
      fi
    fi
    ;;
  restart)
    $0 stop
    sleep 1
    $0 start
    ;;
  attach)
    attachtty "$_runDir/socket"
    ;;
  status)
    stat_busy "Checking $_daemonName status"
    ck_status nwserver
    ;;
  *)
    echo "usage: $0 {start|stop|restart|attach|status}"
esac
exit 0
