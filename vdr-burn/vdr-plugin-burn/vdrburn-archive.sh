#!/bin/sh

# For DEBUG Output - can be left since logfiles are deleted when job finishes
set -x

# To make the script exit whenever a command fails (MUST NOT BE REMOVED)
set -e

# Some versions of growisofs refuse to start when run with sudo, and may
# misdetect this condition if vdr itself is started from a sudo session.
unset SUDO_COMMAND

case $1 in
	mkiso)
		genisoimage -V "$DISC_ID" -f -r -J -l -allow-lowercase -allow-multidot \
				-graft-points $GRAFT_POINTS >"$ISO_FILE"
	;;

	burndir)
		SPEED=""
		if [ $BURN_SPEED -gt 0 ]; then
			SPEED="-speed=$BURN_SPEED"
		fi
		growisofs -use-the-force-luke=tty $SPEED -Z $DVD_DEVICE \
				  -V "$DISC_ID" -f -r -J -l -allow-lowercase -allow-multidot \
				  -graft-points $GRAFT_POINTS
	;;

	pipeiso)
		genisoimage -V "$DISC_ID" -f -r -J -l -allow-lowercase -allow-multidot \
				-graft-points $GRAFT_POINTS | tee "$ISO_FILE" > $ISO_PIPE
	;;

	burniso)
		SPEED=""
		if [ $BURN_SPEED -gt 0 ]; then
			SPEED="-speed=$BURN_SPEED"
		fi
		growisofs -use-the-force-luke=tty $SPEED -dvd-compat \
				  -Z $DVD_DEVICE=$ISO_PIPE
	;;

	recordingmark)
		cp "$CONFIG_PATH/counters/standard" "$RECORDING_PATH/dvd.vdr"
	;;

	archivemark)
		((DVD_ID = `cat $CONFIG_PATH/counters/standard | sed "s/^0*//"` + 1))
		printf "%04d\n" $DVD_ID > "$CONFIG_PATH/counters/standard"
	;;

	*)
		echo "Usage: $0 {demux}"
		exit 1
	;;
esac

exit $?
