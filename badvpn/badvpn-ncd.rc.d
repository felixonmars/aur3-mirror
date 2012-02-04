#!/bin/bash

SVCNAME=badvpn-ncd

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/${SVCNAME}

NCD_PIDFILE="/var/run/${SVCNAME}.pid"
NCD_NAME=${NCD_NAME:-"Network Configuration Daemon"}
NCD_SYSLOG_IDENT=${NCD_SYSLOG_IDENT:-"ncd"}
NCD_EXEC="/usr/bin/badvpn-ncd"

PID=
if [[ -e ${NCD_PIDFILE} ]]; then
	PID=$(cat "${NCD_PIDFILE}" 2>/dev/null)
	if ! [[ $( readlink /proc/$PID/exe 2>/dev/null ) =~ ^${NCD_EXEC}(" (deleted)")?$ ]]; then
		PID=
		rm "${NCD_PIDFILE}" 2>/dev/null
	fi
fi

case $1 in
start)
	if ! [[ -e ${NCD_CONFIG} ]]; then
		echo "Error: configuration file (${NCD_CONFIG}) missing"
		exit 1
	fi

	stat_busy "Starting ${NCD_NAME}"

	args=( "${NCD_ARGS[@]}" --config-file "${NCD_CONFIG}" )
	if [[ -n ${NCD_SYSLOG_IDENT} ]]; then
		args=( "${args[@]}" --logger syslog --syslog-ident "${NCD_SYSLOG_IDENT}" )
	fi

	res=0
	if [[ -z ${PID} ]]; then
		(
			cd / &&
			exec "${NCD_EXEC}" "${args[@]}"
		) 1>/dev/null 2>&1 &
		res=$?
		[[ ${res} -eq 0 ]] && echo "$!" > "${NCD_PIDFILE}"
	fi
	if [[ ${res} -eq 0 ]]; then
		add_daemon ${SVCNAME}
		stat_done
	else
		stat_fail
		exit 1
	fi
	;;

stop)
	stat_busy "Stopping ${NCD_NAME}"
	if [[ ! -z $PID ]] && kill "${PID}" &>/dev/null; then
		while kill -0 "${PID}" &>/dev/null; do sleep 0.01; done
		rm "${NCD_PIDFILE}"
		rm_daemon ${SVCNAME}
		stat_done
	else
		stat_fail
		exit 1
	fi
	;;

restart)
	$0 stop
	$0 start
	;;

*)
	echo "Usage: $0 {start|stop|restart}" >&2
	exit 1

esac
