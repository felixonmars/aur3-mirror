#!/bin/bash

#  fbsplash-chvt                                                             #

#  Helper for Changing Virtual Consoles                                      #
#                                                                            #
#  Get X to change back to the splash VT on exit                             #
#  or chvt from silent splash VT to console to avoid blackscreen             #
#                                                                            #
#  Can determine changing direction from configuration and runlevel          #
#  when used with SysV-Init.                                                 #
#                                                                            #
#  Author:                Kurt J. Bosch    <kjb-temp-2009 at alpenjodel.de>  #
#                                                                            #
#  Distributed under the terms of the GNU General Public License (GPL)       #

# Make sure /proc/cmdline is parsed
unset "${!SPLASH_@}"

. splash-functions.sh

# Add miscsplashutils fgconsole path
[[ $spl_bindir ]] && PATH+=":$spl_bindir"

# Defaults, Configuration
SPLASH_XCHVT_WAIT=5 # seconds (undocumented setting)
SPLASH_XLEVELS=( 5 )
. /etc/conf.d/splash-extras

case $SPLASH_MODE_REQ
in  silent ) splash_vt=$SPLASH_TTY
;; verbose ) splash_vt=1
;;       * ) exit 0
esac

chvt_wait=0
case $1 in -w | --wait )
	chvt_wait=$SPLASH_XCHVT_WAIT
	shift
esac

if [[ $1 ]]; then
	:
elif [[ -z $RUNLEVEL ]]; then
	echo "$0: Error: RUNLEVEL not set in environment. Unable to determine action." >&2
	exit 1
elif [[ " "${SPLASH_XLEVELS[*]}" " = *" "$RUNLEVEL" "* ]]; then
	set -- splash
else
	set -- 1
fi

fgc=$( fgconsole ) || exit 1

if [[ $1 = "splash" ]]; then
	[[ $fgc = "$splash_vt" ]] && exit 0
	echo "Changing to Splash VT (for starting X)"
	chvt "$splash_vt"
elif [[ $1 =~ ^[0-9]+$ ]]; then
	[[ $fgc = 1 ]] && exit 0
	if [[ $fgc = "$splash_vt" ]]; then
		:
	elif (( chvt_wait > 0 )); then
		echo -n "Waiting for Splash VT to be activated (by terminated X)"
		t=$(( chvt_wait * 10 ))
		until [[ $( fgconsole ) = "$splash_vt" ]]; do
			(( -- t >= 0 )) && sleep .1 && continue
			echo " - Timeout!"
			exit 1
		done
		echo
	# If not on splash VT (after waiting until X changes), do nothing
	else
		exit 0
	fi
	echo "Changing from Splash VT to VT#: $1"
	chvt "$1"
else
	echo "Usage: ${0##*/} splash" >&2
	echo "       ${0##*/} [-w|--wait] [<vt-number>]" >&2
	exit 1
fi

# EOF #
