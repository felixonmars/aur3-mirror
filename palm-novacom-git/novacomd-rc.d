#!/bin/bash
# /etc/rc.d/novacomd
# Arch Linux startup script for novacomd

# begin novacomd specific code
[[ -f /etc/conf.d/novacomd ]] && . /etc/conf.d/novacomd

NAME="novacomd"
BIN="/usr/bin/${NAME}"
DAEMON_OPTIONS="-d"

start_cmd(){
  ${BIN} ${DAEMON_OPTIONS} ${NOVACOMD_OPTIONS} &> /dev/null
}

stop_cmd(){
  kill ${PID}
}
# end novacomd specific code

. /etc/rc.conf
. /etc/rc.d/functions

start() {
  PID=$(get_pid ${NAME})
  if [[ -z "${PID}" ]]; then
    if ck_daemon ${NAME}; then
      stat_busy "starting ${NAME}"
      sleep 0.5
      start_cmd
      if [[ ${?} -gt 0 ]]; then
        stat_busy "could not start ${NAME}"
        stat_fail && return 1
      else
        add_daemon ${NAME} && stat_done
      fi
    else
      stat_busy "${NAME} is dead but the run file exists"
      stat_fail && return 1
    fi
  else
    stat_busy "${NAME} is already running (pid ${PID})"
    stat_fail && return 1
  fi
}

stop() {
  PID=$(get_pid ${NAME})
  if [[ -n "${PID}" ]]; then
    if ! ck_daemon ${NAME}; then
      stat_busy "stopping ${NAME}"
      sleep 0.5
      stop_cmd
      if [[ ${?} -gt 0 ]]; then
        stat_busy "could not stop ${NAME}"
        stat_fail && return 1
      else
        rm_daemon ${NAME} && stat_done
      fi
    else
      stat_busy "${NAME} is running but no run file exists"
      stat_fail && return 1
    fi
  else
    stat_busy "${NAME} is not running"
    stat_fail && return 1
  fi
}

status() {
  PID=$(get_pid ${NAME})
  if [[ -n "${PID}" ]]; then
    stat_busy "${NAME} is running (pid ${PID})"
  else
    stat_busy "${NAME} is not running"
  fi
  ck_status ${NAME}
}

case "${1}" in
  start)
    start;;
  stop)
    stop;;
  restart)
    stop; sleep 0.5; start;;
  status)
    status;;
  *)
    echo "usage: ${0} {start|stop|restart|status}"
esac

exit 0
