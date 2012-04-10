#!/bin/sh

#
# based on http://developer.appcelerator.com/question/123123/change-the-python-command-used-by-the-mobilesdk--titanium-studio#answer-218276
#

TITANIUM_STUDIO_BIN=/usr/share/titanium-studio/TitaniumStudio
TITANIUM_STUDIO_NEWNAMESPACE=/usr/share/titanium-studio/titanium-studio-new-namespace
SUDO_BIN=$(which sudo)

titanium_studio_check_binary() {
	binary=$1
	expected=$2
	if [ ! -x "$1" ]; then
		echo "$0: [$binary] does not exist or is not executable ($expected was expected); exiting."
		exit 1
	fi
}

# sanity checks
titanium_studio_check_binary "$SUDO_BIN" "sudo"
titanium_studio_check_binary "$TITANIUM_STUDIO_BIN" "titanium studio binary"
titanium_studio_check_binary "$TITANIUM_STUDIO_NEWNAMESPACE" "titanium studio new namespace wrapper"

# make sure $USER is defined
if [ -z "$USER" ]; then
	echo "$0: user is undefined; please make sure the variable $USER is set to the current user; exiting."
	exit 2
fi

# even though we use 'sudo', we don't run the actual titanium studio with 
# root permissions (unless the user running the script is root himself)
# we need 'sudo' to do the 'mount -n --bind' command. 
$SUDO_BIN $TITANIUM_STUDIO_NEWNAMESPACE sh -c "mount -n --bind /usr/bin/python2 /usr/bin/python; su $USER -c $TITANIUM_STUDIO_BIN"

