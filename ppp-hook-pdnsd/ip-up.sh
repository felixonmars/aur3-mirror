#!/bin/sh

if [ -x "/usr/sbin/pdnsd-ctl" ]; then
	if [ -n "${DNS2}" ]; then
		DNS1="${DNS1},${DNS2}"
	fi
	/usr/sbin/pdnsd-ctl server 0 up ${DNS1}
fi
