#!/bin/sh
case $ACTION in
add)
	if [[ ! -z "$SEQNUM" -a ! -f /tmp/bla ]]; then
		sleep 1;
		/usr/sbin/pppd call speedtch &> /tmp/bla;
		echo -e "--- $SEQNUM ---\n$DEVPATH" >> /tmp/bla;
	fi
	;;
*)
	echo -n "speedtch unknown action: $ACTION" >> /tmp/unknown-action;
esac
