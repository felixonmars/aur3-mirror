#!/bin/bash
# Written by Jonathan Schmidt <j.schmidt@archlinux.us>
#
# glselect - switch between mesa and nvidia gl libraries
#

newlib="$1"

if [ -e /usr/lib/libGLcore.so.1 ]
then
	for i in `ls -l /usr/lib/libGLcore.so.1`
	do
		nvver=${i//libGLcore.so.}
	done
elif [[ "$newlib" = "nvidia" ]]
then
	echo "You do not have nvidia*-utils installed."
	exit 1
fi

if [[ "$newlib" = "mesa" ]]
then
	ln -sf libGL.so.1.2 /usr/lib/libGL.so
	ln -sf libGL.so.1.2 /usr/lib/libGL.so.1
	ln -sf libglx.xorg /usr/lib/xorg/modules/extensions/libglx.so
elif [[ "$newlib" = "nvidia" ]]
then
	ln -sf libGL.so.${nvver} /usr/lib/libGL.so
	ln -sf libGL.so.${nvver} /usr/lib/libGL.so.1
	ln -sf libglx.so.${nvver} /usr/lib/xorg/modules/extensions/libglx.so
elif [[ "$newlib" = "show" ]]
then
	if [[ `readlink /usr/lib/libGL.so` = "libGL.so.1.2" ]]
	then
		echo "mesa"
	elif [[ `readlink /usr/lib/libGL.so` = "libGL.so.${nvver}" ]]
	then
		echo "nvidia"
	else
		echo "You have not setup symlinks yet."
		exit 1
	fi
else
	echo "Usage: glselect [ mesa | nvidia | show ]"
fi

exit
