
#  /etc/rc.d/functions.d/fbsplash-extras.sh                                  #

#  Advanced Fbsplash script for Arch Linux initscripts                       #
#                                                                            #
#  Author:                Kurt J. Bosch    <kjb-temp-2009 at alpenjodel.de>  #
#  Based on the work of:  Greg Helton                <gt at fallendusk.org>  #
#                         Thomas Baechler         <thomas at archlinux.org>  #
#                         Michal Januszewski          <spock at gentoo.org>  #
#                         and others                                         #
#                                                                            #
#  Distributed under the terms of the GNU General Public License (GPL)       #

## Utility functions

# Get a (rough) list of 'services' to start/stop from given initscript
# for triggering splash progress and events
#
splash_initscript_svcs_get() {        # args: <initscript> ['list']
	local fd line msg svc
	exec {fd}<"$1" || return
	while read -u $fd line ; do
		[[ $line =~ (^|[[:space:]])(stat_busy|status)[[:space:]]+(\"([^\"]+)\")? ]] || continue
		msg=${BASH_REMATCH[4]}
		# Sort out skipped
		case $msg
		in *SIGTERM* | *SIGKILL* ) continue ## http://bugs.archlinux.org/task/10536 ## FIXME ##
		esac
		# Print full list
		if [[ ${2} = list ]]; then
			echo $( splash_msg_to_svc "$msg" ) "$msg"
			continue
		fi
		# Try to sort out inactive
		case $msg
		in "Loading Modules"     ) ! [[ $load_modules = off ]]
		;; *RAID*                ) splash_test_file -r /etc/mdadm.conf 'ARRAY.*'
		;; *LVM*                 ) [[ $USELVM = yes || $USELVM = YES ]]
		;; *"encrypted volumes"* ) splash_test_file -r /etc/crypttab
		;; "Setting Hostname"*   ) [[ $HOSTNAME ]]
		;; "Setting NIS Domain Name"* )
			(	[ -r /etc/conf.d/nisdomainname ] && . /etc/conf.d/nisdomainname
				[[ $NISDOMAINNAME ]] )
		;; "Loading Keyboard Map"* ) [[ $KEYMAP ]]
		;; "Setting Consoles to UTF-8 mode"  ) [[ ${LOCALE,,*} == *utf* ]]
		;; "Setting Consoles to legacy mode" ) ! [[ ${LOCALE,,*} == *utf* ]]
		;; "Adding persistent cdrom udev rules" )
			[ -f /dev/.udev/tmp-rules--70-persistent-cd.rules ]
		;; "Adding persistent network udev rules" )
			[ -f /dev/.udev/tmp-rules--70-persistent-net.rules ]
		esac || continue
		# echo a service name
		splash_msg_to_svc "$msg"
	done
	exec {fd}<&-
}

# Test a file and check if it contains any significant lines
#
splash_test_file() {            # args: <test-operator> <file> [<regex>]
	local regex=${3:-'[[:space:]]*[^#[:space:]].*'}
	test ${1} "${2}" && [[ $( <"${2}" ) =~ (^|$'\n')${regex}($'\n'|$) ]]
}

# Generate a 'service' name from a initscript stat_busy message text
#
splash_msg_to_svc() {           # args: <message>
	local msg=${1}
	msg=${msg,,*}    # make lowercase
	msg=${msg%%:*}   # remove variables part
	local svc
	# Try to get an action and object
	if [[ $msg =~ ^(de|un)?(([a-z]+)ing )?((for|up|down|on|off) )?((.{4,}) to .*|(.{4,}))$ ]]
	then
		local action=${BASH_REMATCH[3]}
		local object=${BASH_REMATCH[7]}${BASH_REMATCH[8]}
		# Drop most of the actions to get good start/stop matching
		case $action
		in (activat|add|bring|configur|initializ|load|lock|remov|sav|sett|start|stop)
			svc=$object
		;; (*)
			svc="$action $object"
		esac
	else
		svc=${msg}
	fi
	# Convert whitespace
	svc=${svc//[ $'\t']/_}
	# Fix remaining non-matches
	case $svc
	in   mount_filesystems ) svc=mount_local_filesystems
	esac
	# Use some 'namespace' to allow distinguishing from daemons
	echo _init_$svc
}

## Actual splash code

case $PREVLEVEL:$RUNLEVEL
in N:[S2-5]   ) : # bootup
;; [2-5]:[S1] ) : # go single
;; S:[2-5]    ) : # re-enter multi
;; [2-5]:[06] ) : # shutdown
;; * ) return     # do nothing
esac

# Only do this where needed
# Since we use BASH, all important functions and variables are exported
case ${0#/etc/rc.} in sysinit | multi | single | shutdown )
	# splash-functions.sh will run splash_setup which needs /proc
	/bin/mountpoint -q /proc || /bin/mount -n -t proc none /proc
	export SPLASH_PUSH_MESSAGES="no"
	export SPLASH_VERBOSE_ON_ERRORS="no"
	. /sbin/splash-functions.sh # /etc/conf.d/splash is also sourced by this
	unset options opt i # eliminate splash_setup non local vars    ## FIXME ##
	declare -ix SPLASH_STEPS=0
	declare -ix SPLASH_STEPS_DONE=0
esac

# Verbose mode is handled by fbcondecor kernel patch and daemon script
[[ $SPLASH_MODE_REQ = silent ]] || return 0

# Don't start splash without a tmpfs!
case ${0#/etc/rc.}
in   sysinit )
	declare -A SPLASH_STEPS_SYSINIT=()
	# Continue to use a splash daamon started in initcpio
	if /bin/mountpoint -q /dev/.splash-cache; then
		/bin/mount --move /dev/.splash-cache $spl_cachedir
	# Mount a new tmpfs
	else
		SPLASH_START_PENDING=1
		( splash_cache_prep )
	fi
;;   shutdown )
	( splash_cache_prep )
# Some chvt magic without Fbsplash is done when changing between single- and multi-user
;;   multi  ) :
;;   single )
	[[ $PREVLEVEL != N ]]
;;   * )
	/bin/mountpoint -q $spl_cachedir
esac || return 0

# Write list file for splash_svclist_get
# Count bootup progress steps
# Init sysint steps assoc. array
splash_svc_init() {
	splash_profile info splash_svc_init $1
	case $1
	in sysinit )
		# rc.sysinit 'services'
		SPLASH_STEPS=0
		local svc
		for svc in $( splash_initscript_svcs_get /etc/rc.sysinit ); do
			[[ ${SPLASH_STEPS_SYSINIT[$svc]} ]] && continue # skip missed and dupes
			SPLASH_STEPS_SYSINIT[$svc]=$((++SPLASH_STEPS))
			echo $svc
		done >|$spl_cachedir/svcs_start
		echo $SPLASH_STEPS >|$spl_cachedir/steps_sysinit
		# rc.multi services
		SPLASH_STEPS+=1 # rc.local
		local daemon
		for daemon in "${DAEMONS[@]}"; do
			case $daemon
			in $SPLASH_XSERVICE | @$SPLASH_XSERVICE )
				SPLASH_STEPS+=-1 # revert rc.local
				break
			;; \!* ) continue
			;; \@* ) :
			;;   * ) SPLASH_STEPS+=1
			esac
			echo ${daemon#@}
		done >>$spl_cachedir/svcs_start
		echo $SPLASH_STEPS >|$spl_cachedir/steps_bootup
	;; shutdown )
		local daemon
		# daemons NOT in the DAEMONS array are stopped first
		for daemon in /var/run/daemons/*; do
			[[ -f $daemon ]] || continue
			daemon=${daemon##*/}
			in_array "$daemon" "${DAEMONS[@]}" || echo "$daemon"
		done >|$spl_cachedir/svcs_stop
		# remaining daemons in reverse order
		local i
		for (( i=${#DAEMONS[@]}-1; i>=0; i-- )) do
			[[ ${DAEMONS[i]} == '!'* ]] && continue
			ck_daemon ${DAEMONS[i]#@} || echo ${DAEMONS[i]#@}
		done >>$spl_cachedir/svcs_stop
		# rc.shutdown 'services'
		splash_initscript_svcs_get /etc/rc.shutdown >>$spl_cachedir/svcs_stop
	esac
}

# splash-functions override
#  Expect tmpfs already mounted, call splash_svc_init,
#  support daemon started in initcpio, support sourcing of theme hook scripts
# This is the main function which handles all events.
# Accepted parameters:
#  svc_start <name>
#  svc_stop <name>
#  svc_started <name> [exit-code]
#  svc_stopped <name> [exit-code]
#  svc_start_failed <name> [exit-code]
#  svc_stop_failed <name> [exit-code]
#  svc_input_begin <name>
#  svc_input_end <name>
#  rc_init sysinit|boot|shutdown
#  rc_exit
#  critical
splash() {
	local event=$1; shift
	case $event
	in   rc_init ) # sysinit|boot|shutdown
		[[ $1 = boot || $SPLASH_RESTART ]] || splash_svc_init $1   ## FIXME ##
		set "$1" $RUNLEVEL
	;;   rc_exit )
		set $RUNLEVEL
	;;   svc_started | svc_stopped )
		set "${1}" "${2:-0}"  # name exit-code
	;;&  svc_started ) [[ $2 -eq 0 ]] || event=svc_start_failed
	;;&  svc_stopped ) [[ $2 -eq 0 ]] || event=svc_stop_failed
	esac
	splash_run_hook pre "$event" "$@"
	case $event
	in   rc_init ) # sysinit|boot|shutdown
		if [[ $1 != boot ]]; then
			if [[ $SPLASH_SANITY = insane ||
			      " "$( </proc/cmdline )" " == *" "console=tty1" "* ]]; then
				splash_profile info "splash_start"
				splash_start
				splash_profile info "splash_start exit-code $?"
			else
				splash_msg "Fbsplash requires console=tty1 in kernel line!"
			fi
			unset SPLASH_START_PENDING
		fi
	;;   rc_exit )
		[[ $RUNLEVEL = S ]] || splash_exit
	;;   svc_start_failed | svc_stop_failed ) # name [exit-code]
		# Provide a general failure status
		splash_comm_send update_svc fbsplash-dummy $event
		splash_comm_send paint
		# Simple/upstream way of error handling
		if [[ $SPLASH_VERBOSE_ON_ERRORS = yes ]]; then
			splash_verbose # chvt
		fi
		# Save for chvt restore after X exit
		splash_cache_write "${event#svc_}"-fbsplash-dummy
		splash_cache_write "${event#svc_}"-"$1" # save for restart ## FIXME ##
	;;&  svc_* ) # name [exit-code]
		if [[ $SPLASH_START_PENDING ]]; then
			SPLASH_STEPS_SYSINIT[$1]=0 # missing the step
		else
			splash_comm_send update_svc "$1" "$event"
			splash_comm_send paint
		fi
	;;   svc_input_begin ) # name
		splash_input_begin "$1"
	;;   svc_input_end   ) # name
		splash_input_end   "$1"
	;;   critical )
		splash_verbose
	esac
	splash_run_hook post "$event" "$@"
}

# Append to or create a file within the tmpfs if still mounted
# args: <rel-file-path> [text]...
splash_cache_write() {
	(
		cd "$spl_cachedir" && /bin/mountpoint -q . || exit 1
		file=$1; shift
		if [[ $# -gt 0 ]]; then echo "$@"; fi >>"${file}"
	)
}

splash_msg() {
	splash_profile "info" "$@"
	echo "fbsplash-extras:" "$@"
}

# Run theme hook script if any
splash_run_hook() {             # args: 'pre'|'post' <event> [arg]...
	local hook_name=${2}-${1}
	local hook_script=/etc/splash/$SPLASH_THEME/scripts/$hook_name
	# source is faster, but not supported by old/foreign themes
	if [[ -r ${hook_script}.sh ]]; then
		splash_profile "$@"
		shift 2
		# Export hook name to support symlinked generic scripts
		( SPLASH_HOOK=$hook_name source "${hook_script}.sh" "$@" )
	elif [[ -x $hook_script ]]; then
		splash_profile "$@"
		shift 2
		"$hook_script" "$@"
	fi
}

# splash-functions override - optimized for speed
# Send a command to the splash daemon
splash_comm_send() {
	[[ -r $spl_pidfile ]] || return 1
	if ! kill -0 $( <"$spl_pidfile" ) 2>&-; then
		/bin/rm -f "$spl_pidfile"
		return 1
	fi
	splash_profile comm "$@"
	echo "$@" >$spl_fifo &
}

# splash-functions override
# Always write debug log, regardless of SPLASH_PROFILE
splash_profile() {
	local time rest; read time rest </proc/uptime
	echo "$time: $*" >>$spl_cachedir/profile
}

# Set status message - optimized for speed
splash_update_message() {
	local pidfile=$spl_cachedir/set-msg-pid
	# Cancel any obsolete message
	[[ -f $pidfile ]] && kill $( <$pidfile ) 2>&-
	if splash_comm_send set message "${@}"; then
		echo $! >|$pidfile
	elif [[ -f $pidfile ]]; then
		/bin/rm -f $pidfile
	fi
}

# Now hook into initscripts
case $0
in   /etc/rc.sysinit )
	if [[ ! $SPLASH_START_PENDING ]]; then
		splash_msg "Using initcpio daemon"
		splash_update_message "$SPLASH_BOOT_MESSAGE"
		splash_set_event_dev # grab the keyboard
		splash_svc_init sysinit
		# *no* pre hook script should exist when daemon started in initcpio!
		splash_run_hook post rc_init sysinit $RUNLEVEL
	elif [[ $( /bin/pidof -o %PPID fbcondecor_helper ) ]]; then
		splash_profile info "fbcondecor_helper running"
	# Start splash using dev-FS from initcpio or kernel devtmpfs
	elif [[ -c /dev/fb0 ]]; then
		splash rc_init sysinit
	# Paint the initial splash if not done in initcpio
	elif [[ $( $spl_bindir/fgconsole ) != $SPLASH_TTY ]]; then
		BOOT_MSG=$SPLASH_BOOT_MESSAGE \
			/sbin/fbcondecor_helper 2 init $SPLASH_TTY 0 $SPLASH_THEME
		splash_profile info "fbcondecor_helper exit-code $?"
	fi
	# The infamous Prevent_Splash_Destruction_Magic (tm)
	SPLASH_CONSOLEFONT=$CONSOLEFONT
	CONSOLEFONT=""
	add_hook sysinit_udevlaunched splash_sysinit_udevlaunched
	add_hook sysinit_udevsettled  splash_sysinit_udevsettled
	add_hook sysinit_prefsck      splash_sysinit_prefsck
	add_hook sysinit_postfsck     splash_sysinit_postfsck
	add_hook sysinit_prefsckloop  splash_sysinit_prefsck
	add_hook sysinit_postfsckloop splash_sysinit_postfsck
	add_hook sysinit_end          splash_sysinit_end
	splash_sysinit_udevlaunched() {
		[[ $SPLASH_START_PENDING ]] || return 0
		splash_profile info "sysinit_udevlaunched"
		# Deferre if helper still doing fadein
		if [[ $( /bin/pidof -o %PPID fbcondecor_helper ) ]]; then
			splash_profile info "fbcondecor_helper running"
			return
		fi
		# Just prepare devices required by the daemon before doing all udev
		if [[ $( /bin/pidof -o %PPID /sbin/udevd ) ]]; then
			splash_profile info "udevadm trigger"
			/sbin/udevadm control --property=STARTUP=1
			/sbin/udevadm trigger --action=add --subsystem-match={tty,graphics,input}
			/sbin/udevadm settle
		fi
		if [[ -c /dev/fb0 ]]; then
			splash rc_init sysinit
		else
			splash_profile info "still no framebuffer device!"
		fi
	}
	splash_sysinit_udevsettled() {
		splash_profile info "sysinit_udevsettled"
		# Grab the keyboard again - early grab seems not to work allways
		if [[ ! $SPLASH_START_PENDING ]]; then
			splash_set_event_dev
			return
		fi
		if [[ $( /bin/pidof -o %PPID fbcondecor_helper ) ]]; then
			splash_profile info "splash_wait fbcondecor_helper"
			stat_busy "Waiting for FbConDecor Helper to finish fadein"
			if splash_wait fbcondecor_helper; then
				stat_done
			else
				stat_fail
				splash_msg "Broken framebuffer driver?"
				return
			fi
		fi
		splash rc_init sysinit
	}
	splash_sysinit_prefsck() {
		stat_append " (progress forwarded to Fbsplash)"
		echo # newline!                                        ## FIXME ##
		splash_fsck_push_d
	}
	splash_sysinit_postfsck() {
		if [[ $FSCK_FD ]]; then
			exec {FSCK_FD}>&-
			unset FSCK_FD
		fi
		# fsck failure emergency exit
		if [[ $fsckret -gt 1 && $fsckret -ne 32 ]]; then
			splash_verbose # chvt
		fi
	}
	splash_sysinit_end() {
		read SPLASH_STEPS_DONE <$spl_cachedir/steps_sysinit
		splash_update_progress
		splash rc_exit # just run theme hooks
		# Release the keyboard
		splash_comm_send "set event dev /dev/null"
		# Single-user
		if [[ " "$( </proc/cmdline )" " =~ " "(s|S|single|1)" " ]]; then
			# Drop the splash and umount tmpfs to allow clean mkinitcpio
			splash_exit
			# Umount the tmpfs copying some debug info to the disk
			splash_cache_cleanup profile svcs_start steps_sysinit steps_bootup
			splash_verbose # chvt
			CONSOLEFONT=$SPLASH_CONSOLEFONT set_consolefont
		fi
	}
;;   /etc/rc.multi )
	if [[ $PREVLEVEL = N &&
	      ! " "$( </proc/cmdline )" " =~ " "(s|S|single|1)" " ]]; then
		SPLASH_ACTIVE=1
		read SPLASH_STEPS_DONE <$spl_cachedir/steps_sysinit
		read SPLASH_STEPS      <$spl_cachedir/steps_bootup
		# Grab the keyboard again
		splash_set_event_dev
		# Run any theme hooks
		splash rc_init boot
	fi
	add_hook multi_end splash_multi_end
	start_daemon() {
		if [[ $1 = $SPLASH_XSERVICE ]]; then
			SPLASH_EXIT_TYPE=staysilent splash_end
		fi
		splash_start_daemon $1; local retval=$?
		SPLASH_STEPS_DONE+=1
		splash_update_progress
		return $retval
	}
	start_daemon_bkgd() {
		if [[ $1 = $SPLASH_XSERVICE ]]; then
			SPLASH_EXIT_TYPE=staysilent splash_end
		fi
		stat_bkgd "Starting $1"
		( SPLASH_PUSH_MESSAGES="no" SPLASH_VERBOSE_ON_ERRORS="no" \
			splash_start_daemon $1 ) &>/dev/null &
	}
	splash_start_daemon() {
		if [[ ! $SPLASH_ACTIVE ]]; then
			/etc/rc.d/$1 start
			return $?
		fi
		splash svc_start $1
		/etc/rc.d/$1 start; local retval=$?
		if [[ -e $spl_cachedir/start_failed-$1 ]]; then
			splash svc_start_failed $1 $retval
		else
			if [[ $1 = gpm ]]; then
				splash_comm_send set gpm; splash_comm_send repaint
			fi
			splash svc_started $1 $retval
		fi
		return $retval
	}
	splash_multi_end() {
		# Always stop/paint/fadeout before X does chvt (black screen)
		if ! in_array "$SPLASH_XSERVICE" "${DAEMONS[@]}"; then
			if [[ $RUNLEVEL = 5 ]]
			then SPLASH_EXIT_TYPE=staysilent splash_end
			else splash_end
			fi
		fi
	}
	splash_end() {
		if [[ $SPLASH_ACTIVE ]]; then
			# Stop splash
			splash rc_exit
			unset SPLASH_ACTIVE
			# Umount the tmpfs copying some debug info to the disk
			splash_cache_cleanup profile svcs_start steps_sysinit steps_bootup
			# The infamous blah-blah...
			set_consolefont
		# Prevent X from doing a chvt back to uggly console on exit
		elif [[ $SPLASH_EXIT_TYPE = staysilent ]]; then
			splash_msg "Switching to splash tty for starting X"; chvt $SPLASH_TTY
		fi
	}
;;   /etc/rc.single )
	# Just override X exit chvt to avoid black screen
	if ck_daemon "$SPLASH_XSERVICE"; then # *no* 'daemon' to stop
		if [[ $( /bin/pidof -o %PPID /usr/bin/Xorg ) ]]
		then add_hook single_postkillall splash_single
		else add_hook single_start       splash_single
		fi
	fi
	stop_daemon() {
		/etc/rc.d/$1 stop; local retval=$?
		if [[ $1 = $SPLASH_XSERVICE ]]; then
			splash_single
		fi
		return $retval
	}
	splash_single() {
		splash_wait /usr/bin/Xorg
		splash_verbose # chvt
	}
;; /etc/rc.shutdown )
	# Time based progress - Two seconds intervall to avoid sigkill race
	SPLASH_SLEEP_STEPS=$(( (5+1)/2 ))          # (sigterm_sleep+sigkill_sleep)/2
	SPLASH_STEPS=$(( SPLASH_SLEEP_STEPS + 2 )) # one for daemons, one for the rest
	SPLASH_STEPS_DONE=0
	# No deferred start on SPLASH_XSERVICE to avoid missing errors
	# X should chvt back to SPLASH_TTY and we don't do daemons progress
	add_hook shutdown_start       splash_shutdown_start
	add_hook shutdown_prekillall  splash_shutdown_prekillall
	add_hook shutdown_postkillall splash_restart                   ## FIXME ##
	add_hook shutdown_poweroff    splash_shutdown_poweroff
	splash_shutdown_start() {
		# Override X exit chvt to avoid loosing fadein
		if [[ $PREVLEVEL:,$SPLASH_EFFECTS, == 5:*,fadein,* ]] &&
		   ck_daemon $SPLASH_XSERVICE; then # *no* 'daemon' to stop
			splash_wait /usr/bin/Xorg
			if [[ $( $spl_bindir/fgconsole ) = $SPLASH_TTY ]]; then
				splash_msg "Switching away from splash tty to enable fadein"; chvt 63
			fi
		fi
		# Start splash
		splash rc_init shutdown
		# Prevent gpm from garbling the splash
		if ! ck_daemon gpm; then
			splash_comm_send set gpm; splash_comm_send repaint
		fi
	}
	stop_daemon() {
		splash svc_stop $1
		/etc/rc.d/$1 stop; local retval=$?
		if [[ -e $spl_cachedir/stop_failed-$1 ]]
		then splash svc_stop_failed $1 $retval
		else splash svc_stopped     $1 $retval
		fi
		# verbose on errors restore
		if [[ $1 = $SPLASH_XSERVICE && $SPLASH_VERBOSE_ON_ERRORS = yes &&
		      -e $spl_cachedir/stop_failed-fbsplash-dummy ]]; then
			splash_wait /usr/bin/Xorg
			splash_verbose # chvt
		fi
		return $retval
	}
	splash_shutdown_prekillall() {
		SPLASH_STEPS_DONE+=1 # for stopping 'daemons'
		splash_update_progress
		(
			trap : SIGTERM                                         ## FIXME ##
			restarted=""                                                    ##
			for (( i=0; i<SPLASH_SLEEP_STEPS; i++ )) do
				if [[ ! $( /bin/pidof -o %PPID $spl_daemon ) && ! $restarted ]] ##
				then                                                            ##
					splash_restart                                              ##
					restarted=1                                                 ##
				fi                                                     ## FIXME ##
				/bin/sleep 2
				SPLASH_STEPS_DONE+=1
				splash_update_progress
			done
		) &
		SPLASH_STEPS_DONE+=$SPLASH_SLEEP_STEPS
	}
	## http://bugs.archlinux.org/task/10536                        ## FIXME ##
	splash_restart() {
		[[ $( $spl_bindir/fgconsole ) = $SPLASH_TTY ]] || return 0
		splash_profile info splash_restart
		if [[ $SPLASH_PUSH_MESSAGES = yes ]]; then
			SPLASH_SHUTDOWN_MESSAGE=$SPLASH_BUSY_MSG \
			  SPLASH_REBOOT_MESSAGE=$SPLASH_BUSY_MSG \
			SPLASH_RESTART=1 PROGRESS=$(( 65535*SPLASH_STEPS_DONE/SPLASH_STEPS )) \
				splash rc_init shutdown
		else
			SPLASH_RESTART=1 PROGRESS=$(( 65535*SPLASH_STEPS_DONE/SPLASH_STEPS )) \
				splash rc_init shutdown
		fi
		local svc_event_file
		for svc_event_file in $spl_cachedir/stop_failed-*; do
			[[ -f $svc_event_file ]] || continue
			splash svc_stop_failed ${svc_event_file##*/stop_failed-}
		done
		if [[ -e $spl_cachedir/msg_log ]]; then
			local line
			while read line; do
				splash_comm_send log "$line"
			done <$spl_cachedir/msg_log
		fi
		splash_comm_send repaint
	}
	##
	splash_shutdown_poweroff() {
		# Finish the splash
		SPLASH_EXIT_TYPE=staysilent splash rc_exit
	}
esac

# splash-functions override - Do something usefull
splash_update_progress() {
	if [[ $SPLASH_STEPS -gt 0 ]]; then
		splash_comm_send progress $(( 65535*SPLASH_STEPS_DONE/SPLASH_STEPS ))
		splash_comm_send paint
	fi
}

# splash-functions override - Explain what's going on
splash_verbose() {
	if [[ $( $spl_bindir/fgconsole ) != 1 ]]; then
		splash_msg "Switching to console"; chvt 1
	fi
}

# splash-functions override - Finish the splash stopping the daemon
splash_exit() {
	splash_profile info "splash_exit"
	# Reset status message
	if [[ $SPLASH_PUSH_MESSAGES = yes ]]; then
		splash_update_message "$( splash_get_boot_message )"
		splash_comm_send paint
	fi
	# Set 100% progress
	splash_comm_send progress 65535
	splash_comm_send paint
	SPLASH_PUSH_MESSAGES="no" \
		stat_busy "Stopping Fbsplash daemon"
	local retval=1
	if [[ $( /bin/pidof -o %PPID $spl_daemon ) ]]; then
		# Fadeout/Stop the daemon
		splash_comm_send exit $SPLASH_EXIT_TYPE
		splash_wait $spl_daemon &&
			/bin/rm -f $spl_pidfile
		retval=$?
	else
		splash_msg "No Fbsplash daemon running!"
	fi
	if [ $retval -eq 0 ]
	then stat_done; splash_profile info "splash_exit done"
	else stat_fail; splash_profile info "splash_exit failed"
	fi
}

# Wait until timeout or given binary dies
splash_wait() {
	local -i i=0
	while [[ i++ -lt 100 ]]; do
		[[ $( /bin/pidof -o %PPID "${1}" ) ]] || return 0
		/bin/sleep .1
	done
	splash_msg "Timeout waiting on '$1' to die!"
	return 1
}

# initscripts override
stat_busy() {
	printf "${C_OTHER}${PREFIX_REG} ${C_MAIN}${1}${C_CLEAR} "
	printf "${SAVE_POSITION}"
	deltext
	printf "   ${C_OTHER}[${C_BUSY}BUSY${C_OTHER}]${C_CLEAR} "
	SPLASH_BUSY_MSG=$1
	if [[ $SPLASH_PUSH_MESSAGES = yes ]]; then
		splash_update_message "${1}"
	fi
	case $0
	in /etc/rc.sysinit )
		SPLASH_BUSY_SVC=$( splash_msg_to_svc "$SPLASH_BUSY_MSG" )
		splash svc_start $SPLASH_BUSY_SVC
	;; /etc/rc.shutdown )
		SPLASH_BUSY_SVC=$( splash_msg_to_svc "$SPLASH_BUSY_MSG" )
		splash svc_stop $SPLASH_BUSY_SVC
	esac
}

# initscripts override
stat_done() {
	deltext
	printf "   ${C_OTHER}[${C_DONE}DONE${C_OTHER}]${C_CLEAR} \n"
	case $0
	in /etc/rc.sysinit )
		splash svc_started $SPLASH_BUSY_SVC 0
		splash_sysinit_step
	;; /etc/rc.shutdown )
		splash svc_stopped $SPLASH_BUSY_SVC 0
	esac
}

# initscripts override
stat_fail() {
	deltext
	printf "   ${C_OTHER}[${C_FAIL}FAIL${C_OTHER}]${C_CLEAR} \n"
	# Write to msglog textbox
	splash_comm_send log "Error $SPLASH_BUSY_MSG"
	splash_comm_send paint
	# Save for restart ## FIXME ##
	splash_cache_write msg_log "Error $SPLASH_BUSY_MSG"
	case $PREVLEVEL:$0
	in *:/etc/rc.sysinit )
		splash svc_start_failed $SPLASH_BUSY_SVC
		splash_sysinit_step
	;; *:/etc/rc.shutdown )
		splash svc_stop_failed  $SPLASH_BUSY_SVC
	# Mark 'daemon' service as failed
	;; N:/etc/rc.d/* ) splash_cache_write start_failed-${0##*/}
	;; *:/etc/rc.d/* ) splash_cache_write stop_failed-${0##*/}
	esac
}

splash_sysinit_step() {
	local -i step=${SPLASH_STEPS_SYSINIT[$SPLASH_BUSY_SVC]}
	if [[ $step -gt $SPLASH_STEPS_DONE ]]; then
		SPLASH_STEPS_DONE=$step
		splash_update_progress
	fi
}

# Get a file descriptor and start a daemon for pushing progress info
# from 'fsck -C$FSCK_FD' to the splash status message line
splash_fsck_push_d() {
	[[ -w $spl_fifo && $( /bin/pidof -o %PPID $spl_daemon ) ]] || return
	local fsck_fifo=$spl_cachedir/fsck_fifo
	# drop any old fifo and create a new one
	/bin/rm -f $fsck_fifo && /bin/mkfifo -m 600 $fsck_fifo || return
	(
		spl_pgr=$(( 65535*SPLASH_STEPS_DONE/SPLASH_STEPS ))
		spl_pgr_pid=""
		fsck_pgr=-1
		fsck_pgr_msg=""
		fsck_comm_pid=""
		while :; do
			read -t 2 phase step total fs; ret=$?
			if [[ $ret -eq 0 ]]; then
				new_pgr=$(( 100 * step / total ))
				[[ $new_pgr -eq $fsck_pgr ]] && continue
				fsck_pgr=$new_pgr
				fsck_pgr_msg="[ ${fs}  phase ${phase}  ${fsck_pgr}% ]"
				# avoid Fbsplash autoverbose
				if [[ ! $spl_pgr_pid ]]; then
					( comm_pid=""; while /bin/sleep .5; do [[ $comm_pid ]] && kill $comm_pid
						echo progress $spl_pgr >"${spl_fifo}" & comm_pid=$!
					done ) &
					spl_pgr_pid=$!
				fi
			else
				if [[ $spl_pgr_pid ]]; then
					kill $spl_pgr_pid; spl_pgr_pid=""
				fi
				if [[ $ret -le 128 ]]; then # not a timeout
					break
				elif [[ $fsck_pgr -ge 100 ]]; then # timeout and phase complete
					# for some FS-types fsck doesn't provide progress
					fsck_pgr=-1
					fsck_pgr_msg=""
				fi
			fi
			# cancel obsolete message
			[[ $fsck_comm_pid ]] && kill $fsck_comm_pid
			echo "set message $SPLASH_BUSY_MSG ${fsck_pgr_msg}" >"${spl_fifo}" &
			fsck_comm_pid=$!
		done
		# Reset status message
		splash_update_message "$( splash_get_boot_message )"
	) &>/dev/null <$fsck_fifo &
	exec {FSCK_FD}>$fsck_fifo
}

# EOF #
