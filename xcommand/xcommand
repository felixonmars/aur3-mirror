#!/bin/bash

SOCKET="$HOME/.xcommand.socket"
NC_LISTEN="/usr/bin/nc.openbsd -lkU \"$SOCKET\""
NC_WRITE="/usr/bin/nc.openbsd -U \"$SOCKET\""

[ -r "$HOME/.xcommandrc" ] && . "$HOME/.xcommandrc"

case "$1" in
	"--daemon")
		$NC_LISTEN | "$0" --pipe
		;;
	"--pipe")
		while read LINE; do
			sh -c "$LINE" &
		done
		;;
	*)
		echo "$@" | $NC_WRITE
		;;
esac
