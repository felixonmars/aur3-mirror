#!/bin/bash
#
# A wrapper for applications that need write access
# to a directory that is write protected. We just link
# it to somewhere in home and it will work :)
# - thoughtcrime
#
#
# Configuration
#
# Path to the program
path_program="/usr/share/gtkradiant"
#
# Where will we put the files?
# (Somewhere in home would make sense)
path_target=~/.radiant/1.6.2
#
# Make sure that the temp path is unique
# for each user!
path_temp="/tmp/gtkradiant-`id -un`"
#
# $path_link are the folders where write access
# is required. Both variables are relative to the
# program folder.
path_link=("games")
path_app="radiant.bin"
#
# This is required if the application would find out
# its correctly installed path otherwise
hardlink_app="true"
#
# Configuration end
#

# Install the temporary folder
install -d "$path_temp"

# Link everything from the program in the temporary folder
for file_target in ${path_program}/*; do
	if [[ "$hardlink_app" = "true" && "$path_temp/${file_target##*/}" = "$path_temp/$path_app" ]]; then
		if [ ! -e "$path_temp/$path_app" ]; then
			cp "$file_target"  "$path_temp/$path_app"
		fi
	elif [ ! -L "$path_temp/${file_target##*/}" ]; then
		ln -s "$file_target" "$path_temp/${file_target##*/}"
	fi
done

# Link all folders that need write access
for file_link in ${path_link[@]}; do
	if [ ! -d  "$path_target/$file_link" ]; then
		install -d "$path_target/$file_link"
	fi
	if [ ! -L "$path_temp/$file_link" ]; then
		ln -s "$path_target/$file_link" "$path_temp/$file_link"
	fi
done

# Start the application
cd "$path_temp"
./"$path_app" $*
rm "$path_temp/$path_app"
