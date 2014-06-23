#!/bin/bash
set -e

dmsetup ls | awk '{ print $1 }' | while read DEV
do
	if dmsetup table ${DEV} | awk '{ print $3 }' | grep -q cache
	then
		modprobe dm_cache_cleaner
		systemd-notify --status="Cleaning cache of ${DEV}" || echo "Cleaning cache of ${DEV}"
		TABLE=$( dmsetup table ${DEV} | awk '{ print $1" "$2" "$3" "$4" "$5" "$6" "$7" 0 cleaner 0"}' )
		dmsetup suspend ${DEV}
		dmsetup reload ${DEV} --table "${TABLE}"
		dmsetup resume ${DEV}
		dmsetup status ${DEV}
		dmsetup wait ${DEV}
		REM=$( dmsetup status ${DEV} | awk '{ print $14 }' )
		while [ "${REM}" -gt 0 ]
		do
			systemd-notify --status="Waiting for ${REM} blocks to flush" || echo "Waiting for ${REM} blocks to flush"
			sleep 1
			REM=$( dmsetup status ${DEV} | awk '{ print $14 }' )
		done
	fi
done

