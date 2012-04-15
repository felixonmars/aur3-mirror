#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

name=pattern-device
DEVNAME=pattern
. /etc/conf.d/patterndev

if [ "x$DEVNAME" = "x" ] ; then
	stat_fail
	exit 1
fi

DEVFILE="/dev/${DEVNAME}"

case "$1" in
start)
	stat_busy "Starting ${DEVFILE}"
	[[ -f ${DEVFILE} ]] && { stat_fail; exit 1; }
	/usr/bin/patterndev -n "$DEVNAME" || { stat_fail; exit 1; }
	[[ ! -e ${DEVFILE} ]] && {             sleep 0.2; }
	[[ ! -e ${DEVFILE} ]] && { echo "..."; sleep 0.2; }
	[[ ! -e ${DEVFILE} ]] && { echo "..."; sleep 0.2; }
	[[ ! -e ${DEVFILE} ]] && { stat_fail; exit 1; }
	chmod 666 "${DEVFILE}"
	stat_done
	;;
stop)
	stat_busy "Stopping $name"
	[[ ! -e ${DEVFILE} ]] && { stat_done; exit 1; }
	killall patterndev
	[[ -e ${DEVFILE} ]] && {             sleep 0.2; }
	[[ -e ${DEVFILE} ]] && { echo "..."; sleep 0.2; }
	[[ -e ${DEVFILE} ]] && { echo "..."; sleep 0.2; }
	[[ -e ${DEVFILE} ]] && { killall -9 patterndev; sleep 0.2; }
	[[ -e ${DEVFILE} ]] && { echo "..."; sleep 0.2; }
	[[ -e ${DEVFILE} ]] && { echo "..."; sleep 0.2; }
	[[ -e ${DEVFILE} ]] && { stat_fail; exit 1; }
	stat_done
	;;
*)
	echo "usage: $0 {start|stop}"
	;;
esac
exit 0
