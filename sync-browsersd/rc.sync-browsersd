#!/bin/bash
. /etc/rc.conf
. /etc/rc.d/functions
. /etc/sync-browsersd.conf

case "$1" in
	start)
		stat_busy 'Starting Sync-Browsers Daemon'
		if [[ -z $USERS ]]; then
			printf "\n${C_FAIL}Error:${C_CLEAR} Define at least one user in /etc/sync-browsersd.conf"
			stat_fail && exit 1
		fi

		for i in $USERS; do
			if [[ ! -d /home/$i ]]; then
				printf "\n${C_FAIL}Error:${C_CLEAR} You have defined an invalid user in /etc/sync-browsersd.conf"
				stat_fail && exit 1
			fi
		done

		if [[ -f /run/daemons/sync-browsersd ]]; then
			printf "\n${C_FAIL}Error:${C_CLEAR} Sync-Browsers Daemon is already running!"
			stat_fail && exit 1
		fi

		add_daemon sync-browsersd
		/usr/bin/sync-browsers sync
		stat_done
		;;
	stop)
		stat_busy 'Stopping Sync-Browsers Daemon'
		if [[ ! -f /run/daemons/sync-browsersd ]]; then
			printf "\n${C_FAIL}Error:${C_CLEAR} Umm... Sync-Browsers Daemon isn't running, nothing to stop!"
			stat_fail
		else
			/usr/bin/sync-browsers sync && /usr/bin/sync-browsers unsync
			rm_daemon sync-browsersd
			stat_done
		fi
		;;
	update)
		stat_busy 'Updating Syncs in TMPFS'
		if [[ ! -f /run/daemons/sync-browsersd ]]; then
			printf "\n${C_FAIL}Error:${C_CLEAR} Sync-browsers daemon is not running... cannot update!"
			stat_fail
		else
			/usr/bin/sync-browsers sync
			stat_done
		fi
		;;
	*)
		echo "usage $0 {start|stop|update}"
esac
exit 0
