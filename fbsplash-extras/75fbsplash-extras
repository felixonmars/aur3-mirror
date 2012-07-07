#!/bin/bash

#  /usr/lib/pm-utils/sleep.d/75fbsplash-extras                               #

#  pm-utils hook for ArchLinux (initscripts)                                 #
#                                                                            #
#  Enable icons when hibernating with uswsusp-fbsplash                       #
#                                                                            #
#  Author:                Kurt J. Bosch    <kjb-temp-2009 at alpenjodel.de>  #
#                                                                            #
#  Distributed under the terms of the GNU General Public License (GPL)       #

splash_run_hook() {
	local hook=/etc/splash/${SPLASH_THEME:-default}/scripts/$1
	[[ -x $hook ]] || return 0
	"$hook" "${@:2}"
}

case $1
in hibernate )
	# Prepare for starting s2disk
	(
		. splash-functions.sh && [[ $SPLASH_MODE_REQ = silent ]] || exit 0
		SPLASH_PROFILE="off"
		splash_cache_prep || exit 0
		. /etc/rc.conf
		. /etc/rc.d/functions
		splash_svclist stop >$spl_cachedir/svcs_stop
		splash_run_hook rc_init-pre suspend $RUNLEVEL
	)
;; thaw )
	# Cleanup
	(
		. splash-functions.sh && [[ $SPLASH_MODE_REQ = silent ]] || exit 0
		SPLASH_PROFILE="off"
		splash_run_hook rc_init-post suspend $RUNLEVEL
		splash_run_hook rc_exit-pre  $RUNLEVEL
		splash_cache_cleanup
		splash_run_hook rc_exit-post $RUNLEVEL
	)
esac

exit 0

# EOF #
