#!/bin/bash

# fbsplash-control-functions.bash

# Send commands to fbsplash-controld (if running)
splash_control() {
	local FIFO="/run/fbsplash-controld.fifo" fd ret=0
	[[ -p $FIFO ]] || return 0
	# Open an extra file descriptor to avoid blocking
	exec {fd}<>"$FIFO" || return 1
	case $1
	# Also send splashd commands thru the controld FIFO to maintain order
	in comms ) printf 'comm %s\n' "${@:2}" >"$FIFO" || ret=1
	;;     * ) echo "$*" >"$FIFO" || ret=1
	esac
	exec {fd}>&-
	return $ret
}

# EOF #
