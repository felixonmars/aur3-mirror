#!/bin/bash

#  /etc/rc.d/functions.d/fbsplash-extras.sh                                  #

#  Advanced Fbsplash script for Arch Linux Initscripts                       #
#                                                                            #
#  Author:                Kurt J. Bosch    <kjb-temp-2009 at alpenjodel.de>  #
#  Based on the work of:  Greg Helton                <gt at fallendusk.org>  #
#                         Thomas Baechler         <thomas at archlinux.org>  #
#                         Michal Januszewski          <spock at gentoo.org>  #
#                         and others                                         #
#                                                                            #
#  Distributed under the terms of the GNU General Public License (GPL)       #

# Don't mess if one daemon script runs another (netfs in a loop etc.)
(( SPLASH_RC_DAEMON )) && return 0
[[ $0 = /etc/rc.d/* ]] && export SPLASH_RC_DAEMON=1

# Set $SPLASH_XSERVICE
. /etc/conf.d/splash
. /etc/conf.d/splash-extras

. fbsplash-control-functions.bash

stat_busy() {
	printf "${C_OTHER}${PREFIX_REG} ${C_MAIN}${1}${C_CLEAR} "
	printf "${SAVE_POSITION}"
	deltext
	printf "   ${C_OTHER}[${C_BUSY}BUSY${C_OTHER}]${C_CLEAR} "
	SPLASH_BUSY_MSG=$1
	(( SPLASH_RC_BKGD )) || splash_control push-message "${SPLASH_BUSY_MSG}"
	return 0
}

stat_append() {
	printf "${RESTORE_POSITION}"
	printf -- "${C_MAIN}${1}${C_CLEAR}"
	printf "${SAVE_POSITION}"
	SPLASH_BUSY_MSG+=" $1"
	(( SPLASH_RC_BKGD )) || splash_control push-message "${SPLASH_BUSY_MSG}"
	return 0
}

stat_fail() {
	deltext
	printf "   ${C_OTHER}[${C_FAIL}FAIL${C_OTHER}]${C_CLEAR} \n"
	# Set generic failure service explicitly, write to msglog textbox, save
	splash_control svc-error
	splash_control log "Error $SPLASH_BUSY_MSG"
	splash_svc fail
	return 0
}

SPLASH_EXTRAS_WORKDIR="/run/fbsplash-extras"

export SPLASH_ACTION
export SPLASH_SVC

# args: [ 'start'|'stop' <service-name> | 'fail' ]
splash_svc() {
	local err_file
	if [[ $1 != fail ]]; then
		# End previous service
		if [[ $SPLASH_SVC ]]; then
			err_file=${SPLASH_EXTRAS_WORKDIR}/svc_${SPLASH_ACTION}_failed-${SPLASH_SVC}
			if [[ -f ${err_file} ]]
			then splash_control svc_${SPLASH_ACTION}_failed "${SPLASH_SVC}"
			elif [[ $SPLASH_ACTION = "stop" ]]
			then splash_control svc_stopped "${SPLASH_SVC}"
			else splash_control svc_started "${SPLASH_SVC}"
			fi
		fi
		SPLASH_ACTION=$1
		SPLASH_SVC=$2
	fi
	[[ $SPLASH_SVC ]] || return 0
	err_file=${SPLASH_EXTRAS_WORKDIR}/svc_${SPLASH_ACTION}_failed-${SPLASH_SVC}
	case $1
	# Mark service as failed hiding any errors in case /run unmounted
	in fail )
		( mkdir -p "${SPLASH_EXTRAS_WORKDIR}" && : >| "${err_file}" ) 2>/dev/null
	;; start )
		[[ $SPLASH_SVC = "$SPLASH_XSERVICE" ]] && splash_end_boot
	;;& start | stop )
		# Begin new service
		splash_control svc_${SPLASH_ACTION} "${SPLASH_SVC}"
		# Clean up any old file (from custom pm-utils scripts etc.)
		[[ -f $err_file ]] && rm -f "${err_file}"
	esac
}

case $0
in /etc/rc.sysinit )
	SPLASH_ACTION="start"
	# If we have no /proc at this point, assume no initcpio was used.
	# Let the helper parse the kernel cmdline and init the splash or console background,
	# but don't do this always to avoid visible repaint or 'fbcondecor not supported'
	# console message (can't be redirected).
	[[ -f /proc/cmdline ]] || fbcondecor_helper 2 init
	# Take over splash daemon started in initcpio or start splash ASAP
	# Note: Devices needed like /dev/fb0 must be provided by initcpio or kernel devtmpfs.
	add_hook sysinit_start \
	  splash_sysinit_start
	  splash_sysinit_start() {
		mkdir -p "${SPLASH_EXTRAS_WORKDIR}"
		# Take over initcpio splash cache tmpfs and running splash daemon if any
		local dir mp
		for dir in /run /dev; do
			mp=$dir/.splash-cache
			mountpoint -q "$mp" && break
			mp=""
		done
		if [[ $mp ]]; then
			# Provide /etc/rc.conf HOSTNAME for /etc/conf.d/splash boot message hack
			# Use existing services list files in initcpio splash-cache
			HOSTNAME=$HOSTNAME fbsplash-controld start early "$mp" svcs_start_fg
		elif [[ -c /dev/fb0 ]]; then
			splash_sysinit_start_splash
		fi
		splash_svc start _devices
	}
	splash_sysinit_start_splash() {
		splash_svclist start \
			  "${SPLASH_EXTRAS_WORKDIR}"/svcs_start_fg \
			>|"${SPLASH_EXTRAS_WORKDIR}"/svcs_start
		HOSTNAME=$HOSTNAME fbsplash-controld start bootup \
			"${SPLASH_EXTRAS_WORKDIR}"/svcs_start_fg \
			"${SPLASH_EXTRAS_WORKDIR}"/svcs_start
	}
	add_hook sysinit_udevsettled \
	  splash_sysinit_udevsettled
	  splash_sysinit_udevsettled() {
		# Last chance for framebuffer module to be loaded
		fbsplash-controld ping || splash_sysinit_start_splash
		splash_svc start _volumes
	}
	add_hook sysinit_prefsck \
	  splash_sysinit_prefsck
	  splash_sysinit_prefsck() {
		splash_svc start _filesystems
	}
	# Filesystem check progress
	add_hook sysinit_prefsck      splash_prefsck
	add_hook sysinit_postfsck     splash_postfsck
	# Loop filesystem check (custom) progress
	add_hook sysinit_prefsckloop  splash_prefsck
	add_hook sysinit_postfsckloop splash_postfsck

	add_hook sysinit_postmount \
	  splash_sysinit_postmount
	  splash_sysinit_postmount() {
		splash_svc start _misc
	}
	add_hook sysinit_end \
	  splash_sysinit_end
	  splash_sysinit_end() {
		# Dummy service for SysV-Init 'boot' and running theme hooks
		# May also be used for $SPLASH_XSERVICE to stop the splash at end of rc.sysinit
		splash_svc start fbsplash-boot-dummy
	}
;; /etc/rc.multi )
	if [[ $PREVLEVEL = N ]]; then
		SPLASH_ACTION="start"
		add_hook multi_start \
		  splash_multi_start
		  splash_multi_start() {
			# Dummy service for SysV-Init 'boot' and running theme hooks
			splash_control svc_started fbsplash-boot-dummy
		}
	fi
	# Stop/paint/fadeout splash if still running before enabling login / starting X
	add_hook multi_end \
	  splash_multi_end
	  splash_multi_end() {
		# Avoid race condition and don't change to splash VT again if X already started
		[[ $SPLASH_XSERVICE != fbsplash-boot-dummy ]] && ck_autostart "$SPLASH_XSERVICE" || return 0
		[[ $PREVLEVEL = N ]] && splash_end_boot
		fbsplash-chvt
	}
;; /etc/rc.d/"$SPLASH_XSERVICE" )
	# Stop the splash staying on or changing to the splash TTY before starting X
	case $1
	in start )
		# chvt even if no splash was to stop
		fbsplash-chvt splash || :
	;; stop )
		# If not shutdown/reboot, override X change to splash VT
		[[ $RUNLEVEL != [06] ]] && SPLASH_FGCONSOLE=$( fgconsole ) &&
			splash_set_trap "fbsplash-chvt --wait $SPLASH_FGCONSOLE" EXIT || :
	esac
;; /etc/rc.single )
	# On Single-user boot, drop any splash unmounting tmpfs to allow clean mkinitcpio
	# Switch to console (on runlevel change, after Xorg was killed)
	if [[ $PREVLEVEL = N ]]; then
		SPLASH_ACTION="start"
		add_hook single_start \
		  splash_single_start
		  splash_single_start() {
			# Dummy service for SysV-Init 'boot' and running theme hooks
			splash_control svc_start_failed fbsplash-boot-dummy
			fbsplash-controld stop force
			fbsplash-chvt 1
		}
	elif get_pid Xorg >/dev/null; then
		add_hook single_postkillall \
		  splash_single_postkillall
		  splash_single_postkillall() {
			fbsplash-chvt 1
		}
	fi
;; /etc/rc.shutdown )
	SPLASH_ACTION="stop"
	add_hook shutdown_start \
	  splash_shutdown_start
	  splash_shutdown_start() {
		# No deferred start on SPLASH_XSERVICE to avoid delay
		# X should chvt to splash tty
		mkdir -p "${SPLASH_EXTRAS_WORKDIR}"
		splash_svclist stop \
			  "${SPLASH_EXTRAS_WORKDIR}"/svcs_stop_fg \
			>|"${SPLASH_EXTRAS_WORKDIR}"/svcs_stop
		local mode="shutdown"
		[[ $RUNLEVEL = 6 ]] && mode="reboot"
		fbsplash-controld start $mode \
			"${SPLASH_EXTRAS_WORKDIR}"/svcs_stop_fg "" \
			"${SPLASH_EXTRAS_WORKDIR}"/svcs_stop
		(( $? )) && return 0
		local file
		for file in /run/fbsplash{,-control}d.pid; do
			[[ -f $file ]] && add_omit_pids $( <"$file" )
		done
	}
	add_hook shutdown_prekillall \
	  splash_shutdown_prekillall
	  splash_shutdown_prekillall() {
		# We don't want to store
		# SIGTERM/SIGKILL times, which may vary depending on programs actually running,
		# as the last two (SIGTERM takes full 5 seconds if no response from some process)
		splash_control store
	}
	# Shutdown filesystem check (custom) progress
	add_hook shutdown_prefsck  splash_prefsck
	add_hook shutdown_postfsck splash_postfsck
	# Need to stop on preumount (right after post_killall) to avoid umount failure because of the tmpfs
	# so all these make no sense here:
	#	splash_svc stop _misc
	#	splash_svc stop _filesystems
	#	splash_svc stop _volumes
	#	splash_svc
	add_hook shutdown_preumount \
	  splash_shutdown_preumount
	  splash_shutdown_preumount() {
		fbsplash-controld stop
	}
esac

start_daemon() {
	splash_rc_d "$1" start
}
start_daemon_bkgd() {
	stat_bkgd "Starting $1"
	# Don't hide errors - we wan't to see them if SPLASH_VERBOSE_ON_ERRORS=yes
	have_daemon "$1" && ( SPLASH_SVC="" SPLASH_RC_BKGD=1 splash_rc_d "$1" start ) >/dev/null &
}
stop_daemon() {
	splash_rc_d "$1" stop
}

# args: <daemon> start|stop
splash_rc_d() {
	local action=$2
	splash_svc "$action" "$1"
	have_daemon "$1" && /etc/rc.d/"$1" "$action"
	local ret=$?
	(( ret )) && splash_svc fail
	splash_svc
	return $ret
}

splash_end_boot() {
	splash_control store
	fbsplash-controld stop
}

# Echo list of services relevant for icons (for theme hooks using splash_svclist_get)
# Write list of services relevant for progress (foreground) to given file (if any)
# args: 'start'|'stop' [<svcs-progress-list-file>]
# Note: These are also called from fbsplash-initscripts-services-get.
splash_svclist() {
	local svcs_fg=${2:-/dev/null}
	: >|"$svcs_fg" || return 1
	case $1 in
	start )
		(
			# rc.sysinit pseudo services triggered via run_hook
			pseudo_svcs=( _devices _volumes _filesystems _misc )
			
			start_daemon() {
				echo "${1}"
				echo "${1}" >>"$svcs_fg"
			}
			start_daemon_bkgd() {
				echo "${1}"
			}
			# Internal dummy service for SysV-Init 'boot' and running theme hooks
			# May also be used for $SPLASH_XSERVICE to stop the splash at end of rc.sysinit
			# (start only - hidden from fbsplash-initscripts-services-get)
			[[ $PREVLEVEL = N ]] && pseudo_svcs+=( fbsplash-boot-dummy )
			# Code derived from /etc/rc.multi
			for daemon in "${pseudo_svcs[@]}" "${DAEMONS[@]}"; do
				case $daemon
				in '!'* ) continue
				;; "$SPLASH_XSERVICE" | '@'"$SPLASH_XSERVICE" ) break
				;; '@'* ) start_daemon_bkgd "${daemon#@}"
				;;    * ) start_daemon "$daemon"
				esac
			done
		)
	;; stop )
		(
			# rc.shutdown Pseudo services triggered via run_hook
			pseudo_svcs=( )
			
			stop_daemon() {
				echo "${1}"
				echo "${1}" >>"$svcs_fg"
			}
			stop_all_daemons
			for (( i=${#pseudo_svcs[@]}-1; i>=0; i-- )); do
				stop_daemon "${pseudo_svcs[i]}"
			done
		)
	esac
}

# Start daemon for pushing progress info from
# 'fsck -C$FSCK_FD' to the splash status message line
splash_prefsck() {
	# If no splash, do nothing
	fbsplash-controld ping || return 0
	stat_busy "Starting Splash Filesystem Check Progress Daemon"
		fbsplash-controld fsckd start && exec {FSCK_FD}>"/run/fbsplash-fsckd.fifo"
	(( $? == 0 )) && stat_done || stat_fail
}

splash_postfsck() {
	# fsck seems to push progress updates asynchronously in the background
	if [[ $FSCK_FD ]]; then
		status "Stopping Splash Filesystem Check Progress Daemon"
			fbsplash-controld fsckd stop
		exec {FSCK_FD}>&-
		unset FSCK_FD
	fi
	# fsck failure emergency exit
	if (( ( fsckret | fsckret_loop | 33 ) != 33 )); then
		# Abort splash unmounting the splash cache tmpfs
		fbsplash-controld stop force
		fbsplash-chvt 1
	fi
}

# Function for preparing a cache (faking sysinit) for adding contents to an initrd
# Note: This is called from /usr/lib/initcpio/install/fbsplash (after sourcing splash stuff)
splash_cache_prep_initcpio() {
	SPLASH_MODE_REQ="silent"
	SPLASH_PROFILE="off"
	(
		( splash_cache_prep ) && [[ $spl_cachedir ]] && cd "$spl_cachedir" || exit 1
		export PREVLEVEL=N RUNLEVEL=S
		. /etc/rc.conf
		splash_svclist start svcs_start_fg >|svcs_start
		splash_run_hooks pre rc_init sysinit $RUNLEVEL
		# Write a clean initial profile mainly for splash_manager -c replay
		echo 0.00: pre rc_init sysinit $RUNLEVEL >|profile
		exit 0
	) || return 1
	# Cleanup at mkinitcpio exit
	splash_set_trap splash_cache_cleanup_initcpio EXIT ||
		warning "WARNING: Unable to do umount '$spl_cachedir' and cleanup at exit."
	return 0
}

# Run remaining rc_init/rc_exit hooks for theme specific cleanup (arch-banner themes)
# Unmount the tmpfs
splash_cache_cleanup_initcpio() {
	(
		[[ $spl_cachedir ]] && cd "$spl_cachedir" || exit 0
		export PREVLEVEL=N RUNLEVEL=S
		splash_run_hooks post rc_init sysinit $RUNLEVEL
		splash_run_hooks "pre post" rc_exit $RUNLEVEL
		RUNLEVEL=5
		splash_run_hooks "pre post" rc_init boot $RUNLEVEL
		splash_run_hooks pre rc_exit $RUNLEVEL
		umount -l "${spl_cachedir}" # splash_cache_cleanup mount --move fails silently in chroot
		cd /
		splash_run_hooks post rc_exit $RUNLEVEL
	)
}

# Run theme hooks for SPLASH_THEMES
# args: 'pre'|'post'|'pre post' <event> [arg]...
splash_run_hooks() {
	local pp=$1 event=$2 args=( "${@:3}" )
	shift
	local p
	for p in $pp; do
		local -A done=()
		local theme
		for theme in $SPLASH_THEMES; do
			theme=${theme%%/*}
			(( done[$theme] )) && continue
			local hook=/etc/splash/$theme/scripts/${event}-$p
			[[ -x $hook ]] && SPLASH_THEME=$theme "$hook" "${args[@]}"
			done[$theme]=1
		done
	done
}

# Set a trap command
# args: <trap-arg> <signal-spec>...
splash_set_trap() {
	local arg=$1
	shift
	# Don't mess with disabled signals or any
	# quoted command strings already set, but fail
	[[ -z $( trap -p "$@" ) ]] && trap "$arg" "$@"
}

# EOF #
