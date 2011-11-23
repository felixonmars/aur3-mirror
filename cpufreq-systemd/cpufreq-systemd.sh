#!/bin/bash

# source application-specific settings
[ -f /etc/conf.d/cpufreq ] && . /etc/conf.d/cpufreq

params=""
if [ -n "$governor" ]; then
	mod="cpufreq_$governor"
	params="-g $governor"
	grep -qw "$governor" /sys/devices/system/cpu/cpu*/cpufreq/scaling_available_governors || modprobe -q $mod
	if [ $? -eq 0 ]; then
		if [ "$min_freq" != "" ]; then
			params="$params -d $min_freq"
		fi
		if [ "$max_freq" != "" ]; then
			params="$params -u $max_freq"
		fi
	else
		# Cannot load governor module
		exit -1
	fi
fi

if [ "$params" != "" ]; then
	CPUS=$(sed -ne 's/^processor.* \([0-9]\+\)$/\1/p' /proc/cpuinfo)
	for cpu in $CPUS; do
		cpufreq-set -c $cpu $params
		if [ "$freq" != "" ]; then
			cpufreq-set -c $cpu -f $freq
		fi
	done
else
	# Invalid configuration in /etc/conf.d/cpufreq
	exit -1
fi

exit 0
