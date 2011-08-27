#!/usr/bin/env bash

# The basic framework for adjusting the install location.
[ -z "$DESTDIR" ] && DESTDIR="/" && export DESTDIR
[ -z "$PREFIX" ] && PREFIX="/usr/local" && export PREFIX
NAUTILUS_SCRIPT_SUFFIX="" # Set this to use hierarchical categories for Nautilus scripts.
UNBALL_TARGET="$PREFIX/bin/unball"
MOVETOZIP_TARGET="$PREFIX/bin/moveToZip"
MANPAGES_TARGET="$PREFIX/man/man1"
THUNAR_HOOK_DIR="$PREFIX/libexec/thunar-archive-plugin"

function gen_manpages() {
	# Usage: gen_manpages <command> ...
	# Purpose: If help2man is installed, generate and install manpages from --help and --version
	if which help2man > /dev/null; then
		echo "help2man found. Generating manpages."
		[ -d "$DESTDIR/$MANPAGES_TARGET" ] || mkdir -p "$DESTDIR/$MANPAGES_TARGET"
		for CMD in "$@"; do
			chmod +x "$CMD"
			help2man -N "$CMD" | gzip > "$DESTDIR/$MANPAGES_TARGET/${CMD##*/}.1.gz"
		done
	else
		echo "help2man not found. No manpages will be generated."
	fi

}

function install_nautilus() {
	# Usage: install_nautilus <UID> <GID> <HOMEDIR>
	# Purpose: Install unball and MoveToZip into the Nautilus (GNOME) scripts menu.

	# Find the script dir if it exists. Return if it doesn't.
	if [ -d "$3/.gnome2/nautilus-scripts" ]; then NSCRIPT_PATH="$3/.gnome2/nautilus-scripts"
	elif [ -d "$3/.gnome/nautilus-scripts" ]; then NSCRIPT_PATH="$3/.gnome/nautilus-scripts"
	elif [ -d "$3/Nautilus/scripts" ]; then NSCRIPT_PATH="$3/Nautilus/scripts"
	else return 1
	fi
	
	# Make the script category dir if it doesn't exist
	NSCRIPT_FULL_PATH="$DESTDIR/$NSCRIPT_PATH/$NAUTILUS_SCRIPT_SUFFIX"
	[ ! -d "$NSCRIPT_FULL_PATH" ] && mkdir -p "$NSCRIPT_FULL_PATH" &> /dev/null
	
	# Install the symlinks
	pushd "$NSCRIPT_FULL_PATH" > /dev/null
		ln -s "$UNBALL_TARGET" ./Unball
		chown "$1:$2" ./Unball
		ln -s "$MOVETOZIP_TARGET" "./Move to ZIP"
		chown "$1:$2" "./Move to ZIP"
	popd > /dev/null
}

function user_enum() {
	# Usage: user_enum <command>
	# command will receive <UID> <GID> <HOMEDIR> as it's parameters
	#FIXME: This will break if the homedir path contains spaces.
	for LINE in `cut -sd: -f3,4,6 /etc/passwd`; do
		LINE_SPLIT=`echo $LINE | tr ":" " "`
		$1 $LINE_SPLIT # DON'T just quote the $LINE_SPLIT. It has to expand into 3 positional args.
	done
}

# This will just fail silently if we don't have write permissions for DESTDIR.
# That way, we can just leave the checking to the last minute.
[ ! -d "$DESTDIR/$PREFIX" ] && mkdir -p "$DESTDIR/$PREFIX" &> /dev/null

# Support for installing the Konqueror (KDE) service menu
#if which konqueror &> /dev/null; then
#	if [ -w "$DESTDIR" ]; then
		[ -z "$KDEDIR" ] && KDEDIR=`cut -d: -f1 <<< "$KDEDIRS"`
		[ -z "$KDEDIR" ] && KDEDIR="$PREFIX"
#	else
#		KDEDIR=~/.kde
#	fi
	SERVICEMENU_DIR="${DESTDIR}/${KDEDIR}/share/apps/konqueror/servicemenus"
#	unset KDEDIR # Make sure nobody uses it afterwards since it's not prefixed with DESTDIR.
#fi	

# Do the install.
if [ -w "$DESTDIR/$PREFIX" ] && [ "$1" != "--help" ] ; then
	# Install unball and moveToZip
	echo `sed 's@//*@/@g' <<< "Installing unball to $DESTDIR/$PREFIX/bin"`
	[ -d "$DESTDIR/$PREFIX/bin" ] || mkdir -p "$DESTDIR/$PREFIX/bin"
	install src/unball "$DESTDIR/$UNBALL_TARGET"
	install src/moveToZip "$DESTDIR/$MOVETOZIP_TARGET"
	
	# Install manpages
	gen_manpages src/unball src/moveToZip

	# Install the Konqueror (KDE) hooks
	if [ -n "$SERVICEMENU_DIR" ]; then
#		echo "Konqueror present. Installing service menus."
		[ -d "$SERVICEMENU_DIR" ] || mkdir -p "$SERVICEMENU_DIR"
		install --mode 0644 src/servicemenus/*.desktop "$SERVICEMENU_DIR"
	fi

	# Install the Nautilus (GNOME) hook, but only if it doesn't already exist.
	# This ensures that users won't have unball re-added if they removed it after a previous install.
	NAUTILUS_SKEL_TARGET="/etc/skel/.gnome2/nautilus-scripts"
#	if [ ! -L "$DESTDIR/$NAUTILUS_SKEL_TARGET/Unball" ]; then
#		echo "Installing Nautilus script links."
#		mkdir -p "$DESTDIR/$NAUTILUS_SKEL_TARGET"
#		ln -s "$UNBALL_TARGET" "$DESTDIR/$NAUTILUS_SKEL_TARGET/Unball"
#		ln -s "$MOVETOZIP_TARGET" "$DESTDIR/$NAUTILUS_SKEL_TARGET/Move to ZIP"
#		user_enum install_nautilus
#	fi

	# Install the Thunar (Xfce) hook if the Thunar archive plugin is installed.
	if [ -d "$THUNAR_HOOK_DIR" ]; then
		echo "Installing Thunar (Xfce) archive hooks"
		install src/unball.tap "$DESTDIR/$THUNAR_HOOK_DIR/unball.tap"
	fi

	echo 
#	echo "unball installed. You can now type \"./run_test.py\" to run the unit tests. If tests fail, you probably are missing some extraction tools."
else
	[ "$1" != "--help" ] && echo "Sorry, it appears that you do not have write permissions for the chosen install location."
	echo "The install location can be adjusted using the DESTDIR and PREFIX environment variables."
	echo "There are three main ways to do this:"
	echo '  1. For making debs, rpms, or ebuilds: DESTDIR=$D PREFIX=/usr ./install.sh'
	echo '  2. As root (to put unball in /usr/bin): PREFIX=/usr ./install.sh'
	echo '  3. As a non-root user to install to your home directory: PREFIX=~ ./install.sh'
	echo "The default install location is /usr/local/bin"
	echo
	echo "Also, if you prefer to sort your Nautilus scripts into categories, you can set the NAUTILUS_SCRIPT_SUFFIX variable."
fi
