#!/bin/bash

# Variables
_install="/usr/share/plank-themer"
_plank1="$HOME/.config/plank/dock1"

# Install the dockitem to userspace
cp "$_install/theme_index/plank-themer-ondock.dockitem" "$_plank1/launchers/"

# Place dockitem in Plank (at start?)
const='plank-themer-ondock.dockitem'
if [ -e "$_plank1/settings" ]; then
	grep -q -e "$const" "$_plank1/settings"
	echo "dockitem already there, nothing to do"
	if [ $? = 1 ]; then
		echo "$const; not found but will be inserted as first item!"
		# This could probably be simplified; what's going on here?
		sed -i 's@DockItems=plank.dockitem;;@DockItems=plank.dockitem;;plank-themer-ondock.dockitem;;@' "$_plank1/settings"
		sed -i 's@DockItems=plank.dockitem;;@DockItems=plank.dockitem;;plank-themer-ondock.dockitem;;@' "$_plank1/settings" 
		sed -i 's@plank-themer-ondock.dockitem\n@\n@g' "$_plank1/settings"
	fi
fi


