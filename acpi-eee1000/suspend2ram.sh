#!/bin/sh
if [ -e "/etc/acpi/power.lock" ]; then
	exit 0
fi

source /etc/acpi/eee.conf

if grep -q mem /sys/power/state ; then

	# BEGIN SUSPEND SEQUENCE

	logger "Start suspend sequence"

	# custom command

	logger "Executing user defined command: $PRE_SUSPEND_COMMAND"
	$PRE_SUSPEND_COMMAND
	logger "User defined command executed"

	# get console number
	CONSOLE_NUMBER=$(fgconsole)
	logger "Saving console number: $CONSOLE_NUMBER"

# 	# save the brightness value
# 	BRN=$(cat /proc/acpi/asus/brn)
# 	logger "Saving brightness value: $BRN"
    logger "Saving brightness value: DISABLE (no /proc/acpi/asus/brn)"

	# save the FSB value and go to powersaver mode
# 	/etc/acpi/eee/fsb.sh autosuspend
    logger "Save the FSB value and go to powersaver mode: DISABLE"

	#
	LOADEEE="no"
	EEESTATE=$(lsmod | grep eee | awk {'print $1'})
	if [ "X$EEESTATE" == "Xeee" ];
	    then
	    modprobe -r eee
	    LOADEEE="yes"
	    logger "Unloading eee module";
	fi

	# flush the buffers to disk
	sync

	# change virtual terminal to not screw up X
	chvt 1

	# put us into suspend state
	echo -n "mem" > /sys/power/state

        # BEGIN WAKEUP SEQUENCE

	#Ugly but effective way to restore screen
	#/usr/sbin/vbetool post
	chvt $CONSOLE_NUMBER

	# load the eee module if it was unloaded
	if [ "X$LOADEEE" == "Xyes" ];
	    then
	    modprobe eee
	    logger "eee module loaded";
	fi

	# restore backlight BRN
# 	sleep 1
#         echo $BRN > /proc/acpi/asus/brn
#     logger "Restoring brightness"
    logger "Restoring brightness (DISABLE)"

	# restore the FSB value
# 	/etc/acpi/eee/fsb.sh autoresume
    logger "Restoring the FSB value (DISABLE)"

	# custom command
	logger "Executing user defined command: $POST_SUSPEND_COMMAND"
	$POST_SUSPEND_COMMAND
	logger "User defined command executed"

fi

exit 0
