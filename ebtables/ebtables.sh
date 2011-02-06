#!/bin/bash
#
# init script for the Ethernet Bridge filter tables
#
# Written by Dag Wieers <dag@wieers.com>
# Modified by Rok Papez <rok.papez@arnes.si>
#             Bart De Schuymer <bdschuym@pandora.be>
#
# Adapted (and fixed) for Archlinux by Michal Soltys <soltys@ziu.info>
#

. /etc/rc.conf
. /etc/rc.d/functions

[[ -x /usr/sbin/ebtables ]] || exit 1
[[ -x /usr/sbin/ebtables-save ]] || exit 1
[[ -x /usr/sbin/ebtables-restore ]] || exit 1

RETVAL=0
umask 0077

#default configuration:

EBTABLES_TEXT_FORMAT="yes"
EBTABLES_BINARY_FORMAT="yes"
EBTABLES_MODULES_UNLOAD="yes"
EBTABLES_SAVE_ON_STOP="no"
EBTABLES_SAVE_ON_RESTART="no"
EBTABLES_SAVE_COUNTER="no"

[[ -r "/etc/conf.d/ebtables" ]] && . "/etc/conf.d/ebtables"

start() {
        stat_busy "Starting ebtables"
	if [[ "$EBTABLES_BINARY_FORMAT" = "yes" ]]; then
		for table in $(ls /etc/ebtables/ebtables.* 2>/dev/null | sed -e 's/.*ebtables\.//' -e '/save/d' ); do
			/usr/sbin/ebtables -t ${table} --atomic-file /etc/ebtables/ebtables.${table} --atomic-commit || RETVAL=1
		done
	elif [[ "$EBTABLES_TEXT_FORMAT" = "yes" ]]; then
		[[ ! -r /etc/ebtables/ebtables ]] && :>/etc/ebtables/ebtables
		/usr/sbin/ebtables-restore </etc/ebtables/ebtables || RETVAL=1
	else
		RETVAL=1
	fi

	if (( $RETVAL == 0 )); then
		stat_done
		umask 0022
		add_daemon ebtables
	else
		stat_fail
	fi
}

stop() {
        stat_busy "Stopping ebtables"
	for table in $(grep '^ebtable_' /proc/modules | sed -e 's/ebtable_\([^ ]*\).*/\1/'); do
		/usr/sbin/ebtables -t $table --init-table || RETVAL=1
	done

	if [[ "$EBTABLES_MODULES_UNLOAD" = "yes" ]]; then
		for mod in $(grep -E '^(ebt|ebtable)_' /proc/modules | cut -f1 -d' ') ebtables; do
			/sbin/rmmod $mod 2> /dev/null
		done
	fi

	if (( $RETVAL == 0 )); then
		stat_done
		rm_daemon ebtables
	else
		stat_fail
	fi
}

restart() {
        stop
        sleep 2
        start
}

save() {
        stat_busy "Saving ebtables"
	if [[ "$EBTABLES_TEXT_FORMAT" = "yes" ]]; then
		if [[ -r /etc/ebtables/ebtables ]]; then
			chmod 0600 /etc/ebtables/ebtables
			mv -f /etc/ebtables/ebtables /etc/ebtables/ebtables.save
		fi
		/usr/sbin/ebtables-save >/etc/ebtables/ebtables || RETVAL=1
	fi
	if [[ "$EBTABLES_BINARY_FORMAT" = "yes" ]]; then
		rm -f /etc/ebtables/ebtables.*.save
		for oldtable in $(ls /etc/ebtables/ebtables.* 2>/dev/null | grep -Fv save); do
			chmod 0600 $oldtable
			mv -f $oldtable $oldtable.save
		done
		for table in $(grep '^ebtable_' /proc/modules | sed -e 's/ebtable_\([^ ]*\).*/\1/'); do
			/usr/sbin/ebtables -t $table --atomic-file /etc/ebtables/ebtables.$table --atomic-save || RETVAL=1
			if [[ "$EBTABLES_SAVE_COUNTER" = "no" ]]; then
				/usr/sbin/ebtables -t $table --atomic-file /etc/ebtables/ebtables.$table -Z || RETVAL=1
			fi
		done
	fi

	(( $RETVAL == 0 )) && stat_done || stat_fail
}

case "$1" in
  start)
	if ! ck_daemon ebtables; then
		printhl "Ebtables already started"
		RETVAL=1
	else
		start
	fi
	;;
  stop)
	if ck_daemon ebtables; then
		printhl "Ebtables not yet started"
		RETVAL=1
	else
		[[ "$EBTABLES_SAVE_ON_STOP" = "yes" ]] && save
		stop
	fi
	;;
  restart|reload)
	[[ "$EBTABLES_SAVE_ON_RESTART" = "yes" ]] && save
	restart
	;;
  save)
	save
	;;
  status)
	/usr/sbin/ebtables-save
	RETVAL=$?
	;;
  *)
	echo $"Usage $0 {start|stop|restart|save|status}"
	RETVAL=1
esac

exit $RETVAL
