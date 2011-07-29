#!/bin/sh
#This script is run when Display toggle button (Fn-F5) is pressed.

OUTPUT_DISPLAY_MODE="clone"

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

action="$1"
# if we are being called directly from an ACPI script, do a little hack
if [ "$action" = "hotkey" ]; then
	MODE=`echo $4 | awk '{ print "ibase=16; " toupper($1) " % 3" }' | bc`
	case $MODE in
		0) action="lvds" ;;
		1) action="vga"  ;;
		2) action="both" ;;
	esac
fi

case $action in
	lvds) 
		xrandr --output LVDS --preferred --output VGA --off 
	;;
	both)
		if [ "$OUTPUT_DISPLAY_MODE" == "clone" ]; then
		 xrandr --output LVDS --preferred --output VGA --preferred
		else  
		 xrandr --output LVDS --mode 800x480 --output VGA --"$OUTPUT_DISPLAY_MODE" LVDS
		fi
	;;
	vga)  
		xrandr --output LVDS --off --output VGA --preferred 
	;;
	*)    
		echo "Usage: $0 [lvds|both|vga]"; 
		exit 1 
	;;
esac

