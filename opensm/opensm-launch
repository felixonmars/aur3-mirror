#!/bin/bash
#
# Launch the necessary OpenSM daemons for systemd
# Modifed to work on Archlinux from Fedora opensm-3.3.15-7.fc20.x86_64.rpm
#
# sysconfig: /etc/sysconfig/opensm
# config: /etc/opensm/opensm.conf
#

shopt -s nullglob

prog=/usr/sbin/opensm

if [ -z "$GUIDS" ]; then
	CONFIGS=""
	CONFIG_CNT=0
	for conf in /etc/opensm/opensm.conf.[0-9]*; do
		CONFIGS="$CONFIGS $conf"
		let CONFIG_CNT++
	done
else
	GUID_CNT=0
	for guid in $GUIDS; do
		let GUID_CNT++
	done
fi
# Start opensm
if [ -n "$GUIDS" ]; then
	SUBNET_COUNT=0
	for guid in $GUIDS; do
		SUBNET_PREFIX=`printf "0xfe800000000000%02d" $SUBNET_COUNT`
		(while true; do $prog -g $guid --subnet_prefix $SUBNET_PREFIX; sleep 30; done) &
		let SUBNET_COUNT++
	done
elif [ -n "$CONFIGS" ]; then
	for config in $CONFIGS; do
		(while true; do $prog -F $config; sleep 30; done) &
	done
else
	(while true; do $prog; sleep 30; done) &
fi
exit 0
