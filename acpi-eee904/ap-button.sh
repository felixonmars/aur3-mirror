#!/bin/sh
# Following script is executed once the "AP"- or 
# "Task manager"-button is pressed

source /etc/acpi/eee.conf

if [ -S /tmp/.X11-unix/X0 ]; then
        export DISPLAY=:0
        user=$(who | grep "vc/7" | awk '{ if ($(NF) == "(:0)") print $1 }')
        if [ "$user" = "" ];
        then 
                logger "Could not verify user for X:"
                logger $(who)
                logger "Falling back to XUSER: $XUSER"
		user="$XUSER"
	else
		logger "Found X session user: $user"
	fi
        XAUTHORITY=/home/$user/.Xauthority
        [ -f $XAUTHORITY ] && export XAUTHORITY
else
        logger "X not probably running, lets launch the command anyway"
	user="$XUSER"
fi

logger "Executing $AP_COMMAND as $user"
su $user --login -c "$AP_COMMAND" &
