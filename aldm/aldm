#!/bin/bash
#ArchLinux Daemon Manager

if [ $(whoami) != "root" ]; then
	echo 'You have to be root ;-P'
	exit;
fi;

rc_conf='/etc/rc.conf';
rc_d='/etc/rc.d';

. "$rc_conf";

S=$(echo "$2" | grep -o '[^!#@]*'); #remove flags

list() {
	echo "${DAEMONS[*]}" | tr ' ' "\n";
}

update_conf() {
	NEW="DAEMONS=(${DAEMONS[*]})";
	echo "$NEW";

	CONF="$(cat $rc_conf)"
	echo "$CONF" | sed -ne '1h;1!H;${;g;s/DAEMONS=([^)]*)/'"$NEW"'/g;p;}' > "$rc_conf";
}

case "$1" in
  list)
		list;
		;;
  whatis)
		if [ "$S" != '' ]; then
			ls -1 /var/run/daemons/ | grep ^"$S"$ >/dev/null 2>&1
			if [ $? == 0 ]; then echo -n 'running'; else echo -n 'stopped'; fi
			whatis -l -L C "$S" | grep -o -e ' - \(.*\)$' | cut -d '-' -f 2-
			exit;
		fi;

		ls -1 "$rc_d" | while read i; do
			whatis -l -L C "$i";
		done;
		;;
  enable-fg)
		DAEMONS=($(list | sed "s/^\(!\|@\)$S$/$S/"));
		update_conf;
		;;
  enable-bg)
		DAEMONS=($(list | sed "s/^!\?$S$/@$S/"));
		update_conf;
		;;
  disable)
		DAEMONS=($(list | sed "s/^@\?$S$/!$S/"));
		update_conf;
		;;
  start|stop|restart)
		"$rc_d/$S" "$1";
		;;
  *)
    echo "usage: $0 {list|whatis|enable-fg|enable-bg|disable|start|stop|restart} [service name]

		Note that only daemons specified in $rc_conf can be manipulated - you must add them manually."
esac

