#!/bin/sh
CMDPATH=/usr/share/lm1100maint
CMDBACK=$CMDPATH/lexmarkback
CMDCHANGE=$CMDPATH/lexmarkchange

while getopts "bcd:h" OPTION; do
	case $OPTION in
		b)
			CMD=$CMDBACK
		;;
		c)
			CMD=$CMDCHANGE
		;;
		d)
			DEVICE=$OPTARG
			[ -c $OPTARG ] || echo "`basename $0`: $OPTARG: no such device"
			exit
		;;
		h)
			echo "Usage: `basename $0` -[c|b] -d <DEVICE>"
			exit
		;;
		?)
			exit
		;;
	esac
done
dd if=$CMD of=$DEVICE &>/dev/null
