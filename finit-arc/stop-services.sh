#!/bin/sh

. /etc/rc.conf
. /etc/rc.d/functions

	# Shutdown daemons
	let i=${#DAEMONS[@]}
	while [ $i -ge 0 ]; do
		if [ "${DAEMONS[$i]:0:1}" != '!' ]; then
			ck_daemon ${DAEMONS[$i]#@} || stop_daemon ${DAEMONS[$i]#@}
		fi
		let i=i-1
	done
	# find any leftover daemons and shut them down in reverse order
	if [ -d /var/run/daemons ]; then
		for daemon in $(/bin/ls -1t /var/run/daemons); do
			stop_daemon $daemon
		done
	fi
