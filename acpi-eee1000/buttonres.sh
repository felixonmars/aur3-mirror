#!/bin/bash

source /etc/acpi/eee.conf
source /etc/acpi/eee/user && x_user_func

if [ -n "`/usr/bin/xset -display :0.0 -q | grep -e '  Monitor is Off'`" ]
then
    xset -display :0.0 dpms force on || exit 1
fi

# LCD only
if [ -n "`xrandr | grep 'VGA disconnected'`" ] || [ -n "`xrandr | grep 'VGA connected (normal'`" ]
then
    if [ -n "`xrandr | grep 'current 1024 x 600'`" ]
    then
	xrandr --output LVDS --mode 800x600 || exit 1
    else
	xrandr --output LVDS --mode 1024x600 || exit 1
    fi
# CRT only
elif  [ -n "`xrandr | grep 'LVDS connected (normal'`" ]
then
    if [ -n "`xrandr | grep 'current 1024 x 768'`" ]
    then
	xrandr --output VGA --mode 800x600 || exit 1
    else
	xrandr --output VGA --mode 1024x768 || exit 1
    fi
else
    if [ -n "`xrandr | grep 'current 1024 x 600'`" ]
    then
	xrandr --output VGA --mode 800x600 --output LVDS --mode 800x600 || exit 1
    else
	xrandr --output VGA --mode 1024x600 --output LVDS --mode 1024x600 || exit 1
    fi
fi

exit 0
