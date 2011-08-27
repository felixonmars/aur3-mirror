#!/bin/bash
#
# init script for arptables
#
# Original by Dag Wieers <dag@wieers.com>.
# Modified/changed to arptables by
# 	Rok Papez <rok.papez@arnes.si>.
#
# Adapted for Archlinux by Michal Soltys <soltys@ziu.info>
#

. /etc/rc.conf
. /etc/rc.d/functions

RETVAL=0

[ -x /usr/sbin/arptables ] || exit 1
[ -x /usr/sbin/arptables-save ] || exit 1
[ -x /usr/sbin/arptables-restore ] || exit 1

start() {
	stat_busy "Starting arptables"
	[[ ! -r /etc/arptables/arptables ]] && :>/etc/arptables/arptables

	/usr/sbin/arptables-restore </etc/arptables/arptables || RETVAL=1

        if (( $RETVAL == 0 )); then
                stat_done
                add_daemon arptables
        else
                stat_fail
        fi
}

stop() {
	stat_busy "Stopping arptables"
	/usr/sbin/arptables-restore </dev/null || RETVAL=1

        if (( $RETVAL == 0 )); then
                stat_done
                rm_daemon arptables
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
	stat_busy "Saving arptables"
	/usr/sbin/arptables-save >/etc/arptables/arptables || RETVAL=1

	(( $RETVAL == 0 )) && stat_done || stat_fail
}

case "$1" in
  start)
        if ! ck_daemon arptables; then
                printhl "Arptables already started"
                RETVAL=1
        else
                start
        fi
	;;
  stop)
        if ck_daemon arptables; then
                printhl "Arptables not yet started"
                RETVAL=1
        else
                stop
        fi
	;;
  restart)
	restart
	;;
  save)
	save
	;;
  status)
	/usr/sbin/arptables-save
	RETVAL=$?
	;;
  *)
	echo $"Usage $0 {start|stop|restart|save|status}"
	RETVAL=1
esac

exit $RETVAL
