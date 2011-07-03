
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

[[ -f /sbin/splash-functions.sh ]] || return 0

# Set up splash-functions and configuration

# Only do this where needed,
# since we use BASH, all important functions and variables are exported.
if ! [[ $( type -t splash_setup ) = function ]]; then
	# splash-functions.sh will run splash_setup which needs /proc
	# code line copied from /etc/rc.sysinit
	mountpoint -q /proc || mount -n -t proc proc /proc -o nosuid,noexec,nodev
	export SPLASH_PUSH_MESSAGES SPLASH_VERBOSE_ON_ERRORS
	# /etc/conf.d/splash is also sourced by this
	. /sbin/splash-functions.sh
	# eliminate some non local splash_setup varsiables             ## FIXME ##
	unset options opt i
fi

# Extra functions

# Assoc. array of booleans
# '1' if stat_busy block should trigger a progress step
# '0' if already seen
# indexed by rc.{sysinit,shutdown} pseudo service names
declare -A SPLASH_STEPS_BUSY=()

# Generate a (rough) list of pseudo services from given initscript and functions
# Count steps
# Set up the assoc. array
# Echo the list
# args: <initscript> ['list']
splash_initscript_svcs_get() {
	local file_fd cmd_line msg
	# build assoc. array containing all the busy message text lines for each function name
	exec {file_fd}< <(
		# grep for:
		# * left aligned function beginnings/endings
		# * status message commands
		unset GREP_OPTIONS
		LC_ALL=C grep -owE '^\w+ *\(\)[^}]*$|^\}|stat(us|_busy) "[^"]*"' /etc/rc.d/functions 2>/dev/null
	)
	local -A func_msgs=()
	local func_name=""
	while read -u $file_fd cmd_line; do
		case $cmd_line
		# start of function definition (left aligned)
		in *\(\)* )
			func_name=${cmd_line%%[( ]*}
			continue
		# end of function definition (left aligned)
		;; '}'* )
			func_name=""
		esac
		[[ $func_name ]] || continue
		# status message command line within function
		msg=$( splash_match_busymsg "$cmd_line" ) || continue
		# Store one (pseudo) busy message text line
		func_msgs[$func_name]+=$msg$'\n'
	done
	exec {file_fd}<&-
	exec {file_fd}< <(
		# grep for:
		# * status message commands
		# * calls of known functions
		func_names=${!func_msgs[*]}
		func_names_re=${func_names// /|}
		unset GREP_OPTIONS
		LC_ALL=C grep -owE 'stat(us|_busy) "[^"]*"|(^\t*|if |;) *'"$func_names_re" "$1"
	)
	local msgs
	while read -u $file_fd cmd_line ; do
		# Get one or more busy message text lines
		msgs=$( splash_match_busymsg "$cmd_line" ) ||
		msgs=$( splash_get_funcmsgs "$cmd_line" ) || continue
		local msgs_fd svc
		exec {msgs_fd}< <( echo "$msgs" )
		while read -u $msgs_fd -r msg; do
			# Generate a pseudo service name
			svc=$( splash_msg_to_svc "$msg" )
			# Skip ignored steps and any dupes
			[[ ${SPLASH_STEPS_BUSY[$svc]} ]] && continue
			# Print full list
			if [[ $2 = list ]]; then
				SPLASH_STEPS_BUSY[$svc]=1
				echo $(( ++SPLASH_STEPS )) $svc "$msg"
				continue
			fi
			# Sort out as much inactive as possible
			(
				# Conditional expressions code snipplets copied from initscripts
				# (with some refactoring)
				# Note: Kernel stuff tests like /proc, /sys, cmdline might be wrong
				#       in case of mkinitcpio if kernel configuration differs.
				#       (This would cause progress to be a bit more jumpy.)
				# * ignore exact wording
				# * ignore upper/lowercase changes except for common uppercase abbreviations
				shopt -s nocasematch
				case "$msg ${msg,,} ${msg,,}"
				in *system*time*    ) [[ $HARDWARECLOCK =~ ^(|UTC|localtime)$ ]]
				;; *modules*        ) [[ -f /proc/modules ]] && (( ${#MODULES[*]} ))
				;; *RAID*           ) [[ $USEDMRAID = [Yy][Ee][Ss] && -x $(type -P dmraid) ]]
				;; *BTRFS*          ) [[ $USEBTRFS  = [Yy][Ee][Ss] && -x $(type -P btrfs) ]]
				;; *LVM*            ) [[ $USELVM    = [Yy][Ee][Ss] && -x $(type -P lvm) && -d /sys/block ]]
				;; *crypt*          ) [[ -f /etc/crypttab && $CS ]] && grep -q ^[^#] /etc/crypttab
				;; *filesys*check*  ) [[ -x $(type -P fsck) ]]
				;; *time*zone*      ) [[ $TIMEZONE ]]
				;; *host*name*      ) [[ $HOSTNAME ]]
				;; *keyboard*       ) [[ $KEYMAP ]]
				;; *UTF*8*console*  )   [[ ${LOCALE,,} =~ utf ]]
				;; *legacy*console* ) ! [[ ${LOCALE,,} =~ utf ]]
				esac
			) || continue
			SPLASH_STEPS_BUSY[$svc]=1
			(( SPLASH_STEPS++ ))
			# Echo pseudo service name
			echo $svc
		done
		exec {msgs_fd}<&-
	done
	exec {file_fd}<&-
}

# Get busy message (if any) from given command line otherwise return 1
splash_match_busymsg() {
	[[ $1 =~ ^(stat_busy|status)\ +\"(.*)\" ]] || return 1
	echo "${BASH_REMATCH[2]}"
}

# Get busy message text lines for function called in given command line
# (if any) from assoc. array, otherwise return 1
splash_get_funcmsgs() {
	[[ $1 =~ (^|.*[\t; ])(.+) ]] || return 1
	local msgs=${func_msgs[${BASH_REMATCH[2]}]}
	[[ $msgs ]] || return 1
	echo -n "$msgs"
}

# Generate a pseudo service name from a initscript stat_busy message text
# args: <message>
splash_msg_to_svc() {
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
		in activat|add|bring|configur|initializ|load|lock|remov|sav|sett|start|stop )
			svc=$object
		;; * )
			svc="$action $object"
		esac
	else
		svc=${msg}
	fi
	# Convert whitespace
	svc=${svc//[ $'\t']/_}
	# Fix very long and remaining non-matches
	case $svc
	in   adjust_system_time_and_setting_kernel_timezone ) svc=adjust_system_time
	;;   mount_filesystems                 ) svc=mount_local_filesystems
	;;   remount_root_filesystem_read-only ) svc=mount_root_read-only
	esac
	# Use some 'namespace' to allow distinguishing from daemons
	echo _init_$svc
}

# * Set up progress steps assoc. array
# * Count steps and if sysinit, write to file(s)
# * If not already there from initcpio, write svclist file
#   (for themes using splash_svclist_get)
splash_svc_init() {
	splash_profile info splash_svc_init $1
	case $1
	in sysinit )
		local svclist_file=$spl_cachedir/svcs_start
		[[ -f $svclist_file ]] && svclist_file=/dev/null
		SPLASH_STEPS=0
		# pseudo services
		splash_initscript_svcs_get /etc/rc.sysinit >|$svclist_file
		echo $SPLASH_STEPS >|$spl_cachedir/steps_sysinit
		# rc.local
		(( SPLASH_STEPS++ ))
		# daemon services
		local daemon
		for daemon in "${DAEMONS[@]}"; do
			case $daemon
			in '!'* )
				continue
			;; $SPLASH_XSERVICE | '@'$SPLASH_XSERVICE )
				(( SPLASH_STEPS-- )) # rc.local won't be seen
				break
			;; [^@]* )
				(( SPLASH_STEPS++ ))
			esac
			echo ${daemon#@}
		done >>$svclist_file
		echo $SPLASH_STEPS >|$spl_cachedir/steps_bootup
	;; shutdown )
		local svclist_file=$spl_cachedir/svcs_stop
		: >|$svclist_file
		# rc.local.shutdown
		SPLASH_STEPS=1
		# daemon services
		SPLASH_STEPS=$(
			stop_daemon() {
				(( SPLASH_STEPS++ ))
				echo "$1" >>$svclist_file
			}
			stop_all_daemons
			echo $SPLASH_STEPS
		)
		# pseudo services
		splash_initscript_svcs_get /etc/rc.shutdown >>$svclist_file
	esac
}

splash_busy_step() {
	if (( SPLASH_STEPS_BUSY[$SPLASH_BUSY_SVC] )); then
		(( SPLASH_STEPS_DONE++ ))
		splash_update_progress
	fi
	# ignore the step if splash not yet started or when repeated
	SPLASH_STEPS_BUSY[$SPLASH_BUSY_SVC]=0
}

# Function for preparing a cache (faking sysinit) for adding it to an initcpio
splash_cache_prep_initcpio() {
	(
		export PREVLEVEL=N RUNLEVEL=S
		. /etc/rc.conf
		SPLASH_MODE_REQ=silent
		( splash_cache_prep ) || exit 1
		splash_svc_init sysinit
		declare -A done=()
		for theme in $SPLASH_THEMES; do
			theme=${theme%%/*}
			(( done[$theme] )) && continue
			SPLASH_THEME=$theme splash_run_hook pre rc_init sysinit $RUNLEVEL
			done[$theme]=1
		done
		exit 0
	) || return 1
	# Add function call to trap for unmounting the tmpfs on mkinitcpio exit
	if [[ $( trap -p EXIT ) =~ ^(trap )(-- )['](.*)[']( EXIT)|$ ]]; then
		local cmd=${BASH_REMATCH[3]%;}
		[[ $cmd ]] && cmd+="; "
		# not using splash_cache_cleanup - mount --move fails silently in chroot
		trap "${cmd}umount ${spl_cachedir}" EXIT
	else
		splash_msg "WARNING: Unable to add commmand to exit trap for unmounting '$spl_cachedir'" >&2
	fi
	return 0
}

# Create or append to a file within the tmpfs if [still] mounted
# The created file may be empty.
# args: <simple-file-name> [text]...
splash_cache_write() {
	(
		[[ $spl_cachedir ]] && cd "$spl_cachedir" && mountpoint -q . || exit 1
		file=$1
		shift
		if (( $# )); then
			echo "$@"
		fi >>"${file}"
	)
}

splash_msg() {
	splash_profile "info" "$@"
	echo "fbsplash-extras:" "$@"
}

# Run theme hook script (if any)
# args: 'pre'|'post' <event> [arg]...
splash_run_hook() {
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

# Deactivate splash and maybe prepare X start
splash_exit_boot() {
	if mountpoint -q $spl_cachedir; then
		SPLASH_STEPS_DONE=$SPLASH_STEPS
		splash_update_progress
		# Stop splash (or just run theme hooks in case of sysinit)
		splash rc_exit
		# Deferred from sysinit
		set_consolefont
	# Prevent X from doing a chvt back to ugly console on exit
	elif [[ $SPLASH_EXIT_TYPE = staysilent && $( fgconsole ) != $SPLASH_TTY ]]; then
		splash_msg "Switching to splash tty for starting X"
		chvt $SPLASH_TTY
	fi
}

# Wait until given binary dies or timeout
splash_wait() {
	local i
	for (( i=0; i<100; i++ )); do
		[[ $( pidof -o %PPID "${1}" ) ]] || return 0
		sleep .1
	done
	splash_msg "Timeout waiting on '$1' to die!"
	return 1
}

# Daemon for pushing progress info from 'fsck -C$FSCK_FD'
# to the splash status message line
splash_fsck_push_d() {
	[[ -w $spl_fifo && $( pidof -o %PPID $spl_daemon ) ]] || return 1
	local fsck_fifo=$spl_cachedir/fsck_fifo
	# Drop any old fifo and create a new one
	rm -f $fsck_fifo && mkfifo -m 600 $fsck_fifo || return 1
	(
		# don't rely on catching the previous stat_busy
		busy_msg="Checking Filesystems"
		spl_progress=$(( 65535 * SPLASH_STEPS_DONE / SPLASH_STEPS ))
		spl_comm_pid=""
		fsck_progress=-1
		fsck_progress_msg=""
		while :; do
			read -t 2 phase step total fs
			ret=$?
			if (( ret == 0 )); then
				new_pgr=$(( 100 * step / total ))
				(( new_pgr == fsck_progress )) && continue
				fsck_progress=$new_pgr
				fsck_progress_msg="[ ${fs}  phase ${phase}  ${fsck_progress}% ]"
				# Cancel obsolete message to avoid flooding the FIFO
				[[ $spl_comm_pid ]] && kill $spl_comm_pid
				(	# avoid Fbsplash autoverbose as long as we have text progress
					echo progress $spl_progress
					echo set message "${busy_msg} ${fsck_progress_msg}"
				) >$spl_fifo &
				spl_comm_pid=$!
			elif (( ret <= 128 )); then # not a timeout
				break
			elif (( fsck_progress >= 100 )); then # timeout and phase complete
				# for some FS-types fsck doesn't provide progress, so wipe it
				fsck_progress=-1
				echo set message "${busy_msg}" >$spl_fifo &
			fi
		done
		# Reset status message
		splash_comm_send set message "$( splash_get_boot_message )"
	) &>/dev/null <$fsck_fifo &
	exec {FSCK_FD}>$fsck_fifo
}

splash_start_daemon() {
	splash svc_start "$1"
	have_daemon "$1" && /etc/rc.d/"$1" start
	local retval=$?
	if (( retval )) || [[ -e $spl_cachedir/start_failed-$1 ]]; then
		splash svc_start_failed $1 $retval
	else
		if [[ $1 = gpm ]]; then
			splash_comm_send set gpm
			splash_comm_send repaint
		fi
		splash svc_started "$1" $retval
	fi
	return $retval
}

# Don't go further if no splash is demanded (in kernel cmdline)
# 'verbose' splash mode is handled by fbcondecor daemon script

[[ $SPLASH_MODE_REQ = silent ]] || return 0

# Override some splash-functions

# This is the main function which handles splash events
# Changes:
# * Allow cache tmpfs already mounted
# * Don't write ugly generic messages to the splash log
# * Provide a general failure status (dummy service)
# * Support sourcing of theme hook scripts
# args: <event> [arg]...
splash() {
	[[ $SPLASH_MODE_REQ = off ]] && return 0
	local event=$1; shift
	case $event
	in   rc_init ) # args: sysinit|boot|shutdown
		if [[ $1 != boot ]]; then
			# rc_init-hooks may write some files - only allow with tmpfs mounted
			mountpoint -q $spl_cachedir || ( splash_cache_prep ) || return 1
		fi
		set -- "$1" $RUNLEVEL
	;;   rc_exit )
		set -- $RUNLEVEL
	;;   svc_started | svc_stopped )
		set -- "${1}" "${2:-0}"  # args: <name> exit-code
	;;&  svc_started ) [[ $2 -eq 0 ]] || event=svc_start_failed
	;;&  svc_stopped ) [[ $2 -eq 0 ]] || event=svc_stop_failed
	esac
	splash_run_hook pre "$event" "$@"
	case $event
	in   rc_init ) # args: sysinit|boot|shutdown
		if [[ $1 != boot ]]; then
			splash_profile info "splash_start"
			splash_start
			splash_profile info "splash_start exit-code $?"
		fi
	;;   rc_exit )
		splash_exit
	;;   svc_start_failed | svc_stop_failed ) # args: <name> [exit-code]
		# Provide a general failure status
		splash_comm_send update_svc fbsplash-dummy $event
		splash_comm_send paint
		# Simple/upstream way of error handling
		[[ $SPLASH_VERBOSE_ON_ERRORS = yes ]] && splash_verbose # chvt
		# Save for chvt restore after X exit
		splash_cache_write "${event#svc_}"-fbsplash-dummy
	;;&  svc_* ) # args: <name> [exit-code]
		splash_comm_send update_svc "$1" "$event"
		splash_comm_send paint
	;;   svc_input_begin ) # args: <name>
		splash_input_begin "$1"
	;;   svc_input_end   ) # args: <name>
		splash_input_end   "$1"
	;;   critical )
		splash_verbose
	esac
	splash_run_hook post "$event" "$@"
}

# Send a command to the splash daemon
# Using kill builtin instead of pidof binary for speed
splash_comm_send() {
	[[ -r $spl_pidfile ]] || return 1
	if ! kill -0 $( <"$spl_pidfile" ) 2>&-; then
		rm -f "$spl_pidfile"
		return 1
	fi
	splash_profile comm "$@"
	echo "$@" >$spl_fifo &
}

# Explain what's going on
splash_verbose() {
	[[ $( $spl_bindir/fgconsole ) = 1 ]] && return 0
	splash_msg "Switching to console"
	chvt 1
}

# Bashified for speed
splash_profile() {
	[[ $SPLASH_PROFILE = on ]] || return 0
	local time rest
	read time rest </proc/uptime
	echo "$time: $*" >>$spl_cachedir/profile
}

# Finish the splash, stop the daemon and umount cache tmpfs
splash_exit() {
	# If not Single-user boot, just theme hooks are run
	[[ $1 != single ]] && [[ $0 = /etc/rc.sysinit || $PREVLEVEL:$RUNLEVEL = N:S ]] && return 0
	splash_profile info "splash_exit"
	if [[ $SPLASH_MODE_REQ = silent ]]; then
		# Reset status message
		if [[ $SPLASH_PUSH_MESSAGES = yes ]]; then
			splash_comm_send set message "$( splash_get_boot_message )"
			splash_comm_send repaint # needed if daemon started with --type other than bootup
		fi
		splash_msg "Stopping Fbsplash daemon"
		local ret=1
		if [[ $( pidof -o %PPID $spl_daemon ) ]]; then
			# Let the daemon do the message update
			sleep .1
			# Fadeout/Stop the daemon
			splash_comm_send exit $SPLASH_EXIT_TYPE
			splash_wait $spl_daemon && rm -f $spl_pidfile
			ret=$?
		else
			splash_msg "No Fbsplash daemon running!"
		fi
		if (( ret ))
		then splash_profile info "splash_exit failed"
		else splash_profile info "splash_exit done"
		fi
	fi
	# Umount the tmpfs copying most important files to the disk
	# (for any remaining services theme hooks and for debugging)
	splash_cache_cleanup svcs_start steps_sysinit steps_bootup
}

# Do something usefull
splash_update_progress() {
	(( SPLASH_STEPS > 0 )) || return 0
	splash_comm_send progress $(( 65535 * SPLASH_STEPS_DONE / SPLASH_STEPS ))
	splash_comm_send paint
}

# Override some initscripts functions

stat_busy() {
	printf "${C_OTHER}${PREFIX_REG} ${C_MAIN}${1}${C_CLEAR} "
	printf "${SAVE_POSITION}"
	deltext
	printf "   ${C_OTHER}[${C_BUSY}BUSY${C_OTHER}]${C_CLEAR} "
	SPLASH_BUSY_MSG=$1
	if [[ $SPLASH_PUSH_MESSAGES = yes ]]; then
		splash_comm_send set message "${1}"
		splash_comm_send repaint # needed if daemon started with --type other than bootup
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

stat_done() {
	deltext
	printf "   ${C_OTHER}[${C_DONE}DONE${C_OTHER}]${C_CLEAR} \n"
	case $0
	in /etc/rc.sysinit )
		splash svc_started $SPLASH_BUSY_SVC 0
		splash_busy_step
	;; /etc/rc.shutdown )
		splash svc_stopped $SPLASH_BUSY_SVC 0
		splash_busy_step
	esac
}

stat_fail() {
	deltext
	printf "   ${C_OTHER}[${C_FAIL}FAIL${C_OTHER}]${C_CLEAR} \n"
	# Write to msglog textbox
	splash_comm_send log "Error $SPLASH_BUSY_MSG"
	splash_comm_send paint
	case $PREVLEVEL:$0
	in *:/etc/rc.sysinit )
		splash svc_start_failed $SPLASH_BUSY_SVC
		splash_busy_step
	;; *:/etc/rc.shutdown )
		splash svc_stop_failed  $SPLASH_BUSY_SVC
		splash_busy_step
	# Mark 'daemon' service as failed
	;; N:/etc/rc.d/* ) splash_cache_write start_failed-${0##*/}
	;; *:/etc/rc.d/* ) splash_cache_write stop_failed-${0##*/}
	esac
	return 0
}

start_daemon() {
	if [[ $1 = $SPLASH_XSERVICE ]]; then
		SPLASH_EXIT_TYPE=staysilent splash_exit_boot
	fi
	splash_start_daemon "$1"
	local retval=$?
	# Only step if SPLASH_STEPS is set (not exported!)
	if (( SPLASH_STEPS > 0 )); then
		(( SPLASH_STEPS_DONE++ ))
		splash_update_progress
	fi
	return $retval
}

start_daemon_bkgd() {
	if [[ $1 = $SPLASH_XSERVICE ]]; then
		SPLASH_EXIT_TYPE=staysilent splash_exit_boot
	fi
	stat_bkgd "Starting $1"
	have_daemon "$1" &&
	( SPLASH_PUSH_MESSAGES="no" SPLASH_VERBOSE_ON_ERRORS="no" \
		splash_start_daemon "$1" ) &>/dev/null &
}

stop_daemon() {
	splash svc_stop "$1"
	have_daemon "$1" && /etc/rc.d/"$1" stop
	local retval=$?
	if (( retval )) || [[ -e $spl_cachedir/stop_failed-$1 ]]
	then splash svc_stop_failed "$1" $retval
	else splash svc_stopped     "$1" $retval
	fi
	# Only step if SPLASH_STEPS is set (not exported!)
	if (( SPLASH_STEPS > 0 )); then
		(( SPLASH_STEPS_DONE++ ))
		splash_update_progress
	fi
	# After Xorg exit change to console if 'verbose on errors' or going Singe-user
	if [[ $1 = $SPLASH_XSERVICE ]] &&
	   [[ $0 = /etc/rc.single || $SPLASH_VERBOSE_ON_ERRORS = yes &&
	       -e $spl_cachedir/stop_failed-fbsplash-dummy ]]; then
		splash_wait Xorg
		splash_verbose # chvt
	fi
	return $retval
}

## -- cut here - ##
## FIXME ## Remove these as soon as merged into initscripts and released to core

# Stop all daemons
# This function should *never* ever perform any other actions beside calling stop_daemon()!
# It might be used by a splash system to count or get a list of daemons to be stopped.
stop_all_daemons() {
	# Find daemons NOT in the DAEMONS array. Shut these down first
	local daemon
	for daemon in /run/daemons/*; do
		[[ -f $daemon ]] || continue
		daemon=${daemon##*/}
		in_array "$daemon" "${DAEMONS[@]}" || stop_daemon "$daemon"
	done

	# Shutdown daemons in reverse order
	local i
	for (( i=${#DAEMONS[@]}-1; i>=0; i-- )); do
		[[ ${DAEMONS[i]} = '!'* ]] && continue
		ck_daemon ${DAEMONS[i]#@} || stop_daemon ${DAEMONS[i]#@}
	done
}

kill_everything() {
	# $1 = where we are being called from.
	# This is used to determine which hooks to run.

	run_hook "$1_prestopdaemons"

	stop_all_daemons

	run_hook "$1_prekillall"

	# Terminate all processes
	# and wait until timeout or killall5 reports all done
	# Unfortunately killall5 does not support the 0 signal, so just
	# use SIGCONT for checking (which should be ignored).
	stat_busy "Sending SIGTERM To Processes"
		local i
		killall5 -15 ${omit_pids[@]/#/-o } &>/dev/null
		for (( i=0; i<20 && $?!=2; i++ )); do
			sleep .25 # 1/4 second
			killall5 -18 ${omit_pids[@]/#/-o } &>/dev/null
		done
	stat_done

	stat_busy "Sending SIGKILL To Processes"
		local i
		killall5 -9 ${omit_pids[@]/#/-o } &>/dev/null
		for (( i=0; i<4 && $?!=2; i++ )); do
			sleep .25 # 1/4 second
			killall5 -18 ${omit_pids[@]/#/-o } &>/dev/null
		done
	stat_done

	run_hook "$1_postkillall"
}
## -- cut here - ##

# Activate splash in rc.{sysinit,shutdown} and then hook into initscripts
# (or when changing between Single- and Multi-user)

case $0
in /etc/rc.sysinit )
	# Continue to use a splash daamon started in initcpio
	if mountpoint -q /dev/.splash-cache; then
		mount --move /dev/.splash-cache $spl_cachedir || return 0
		splash_msg "Using initcpio daemon"
		splash_comm_send set message "$SPLASH_BOOT_MESSAGE"
		splash_svc_init sysinit
		# pre-rc_init hook should be run during mkinitcpio
		splash_run_hook post rc_init sysinit $RUNLEVEL
	# Mount a new tmpfs and start splash ASAP
	else
		( splash_cache_prep ) || return 0
		SPLASH_START_PENDING=1
		if [[ $( pidof -o %PPID fbcondecor_helper ) ]]; then
			splash_profile info "fbcondecor_helper running"
		# device node provided by initcpio or kernel devtmpfs
		elif [[ -c /dev/fb0 ]]; then
			splash_sysinit_splash_start
		# Paint the initial splash if not done in initcpio
		elif [[ $( $spl_bindir/fgconsole ) != $SPLASH_TTY ]]; then
			BOOT_MSG=$SPLASH_BOOT_MESSAGE \
				fbcondecor_helper 2 init $SPLASH_TTY 0 $SPLASH_THEME
			splash_profile info "fbcondecor_helper exit-code $?"
		fi
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
		(( SPLASH_START_PENDING )) || return 0
		splash_profile info "sysinit_udevlaunched"
		# Deferre if helper still doing fadein
		if [[ $( pidof -o %PPID fbcondecor_helper ) ]]; then
			splash_profile info "fbcondecor_helper running"
			return 0
		fi
		# Try to prepare devices required by the daemon
		splash_profile info "udevadm trigger"
		udevadm trigger --action=add --subsystem-match={tty,graphics,input}
		udevadm settle --timeout=1
		if [[ -c /dev/fb0 ]]; then
			splash_sysinit_splash_start
		else
			splash_profile info "still no framebuffer device!"
		fi
	}
	splash_sysinit_udevsettled() {
		splash_profile info "sysinit_udevsettled"
		if (( ! SPLASH_START_PENDING )); then
			# If possible, try again to grab the keyboard
			[[ -e /dev/.splash-cache ]] || splash_set_event_dev
		elif [[ $( pidof -o %PPID fbcondecor_helper ) ]]; then
			splash_profile info "splash_wait fbcondecor_helper"
			stat_busy "Waiting for FbConDecor Helper to finish fadein"
			if splash_wait fbcondecor_helper; then
				stat_done
				splash_sysinit_splash_start
			else
				stat_fail
				splash_msg "Broken framebuffer driver?"
			fi
		fi
	}
	# Setup step counting and start splash
	splash_sysinit_splash_start() {
		splash_svc_init sysinit
		splash  rc_init sysinit
		unset SPLASH_START_PENDING
	}
	splash_sysinit_prefsck() {
		splash_msg "Grabbing filesystem check progress output"
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
		# Just run theme hooks
		splash rc_exit
		# If possible, release the keyboard to be save in case of messed inittab
		[[ -e /dev/.splash-cache ]] || splash_comm_send "set event dev /dev/null"
		# If Single-user boot, drop splash and unmount to allow clean mkinitcpio
		[[ " "$( </proc/cmdline )" " =~ " "(s|S|single|1)" " ]] || return 0
		splash_exit single
		splash_verbose # chvt
		# The infamous blah-blah...
		CONSOLEFONT=$SPLASH_CONSOLEFONT set_consolefont
	}
;; /etc/rc.multi )
	if mountpoint -q $spl_cachedir; then
		read SPLASH_STEPS_DONE <$spl_cachedir/steps_sysinit
		read SPLASH_STEPS      <$spl_cachedir/steps_bootup
		# If possible, grab the keyboard again
		[[ -e /dev/.splash-cache ]] || splash_set_event_dev
		# Run any theme hooks
		splash rc_init boot
	fi
	add_hook multi_end splash_multi_end
	splash_multi_end() {
		# Always stop/paint/fadeout before X does chvt
		# Even when splash was killed because booting via single-user
		# some chvt magic is needed to keep X from switching to VT1
		if ! in_array "$SPLASH_XSERVICE" "${DAEMONS[@]}"; then
			if [[ $RUNLEVEL = 5 ]]
			then SPLASH_EXIT_TYPE=staysilent splash_exit_boot
			else splash_exit_boot
			fi
		fi
	}
;; /etc/rc.single )
	[[ $PREVLEVEL = N ]] && return 0
	# Override X exit chvt to avoid black screen
	if ! [[ $( pidof -o %PPID Xorg ) ]]; then
		splash_verbose # chvt
	elif ck_daemon "$SPLASH_XSERVICE"; then
		add_hook single_postkillall splash_single_postkillall
	fi
	splash_single_postkillall() {
		splash_wait Xorg
		splash_verbose # chvt
	}
;; /etc/rc.shutdown )
	( splash_cache_prep ) || return 0
	# No deferred start on SPLASH_XSERVICE to avoid missing errors
	# X should chvt back to SPLASH_TTY
	add_hook shutdown_start          splash_shutdown_start
	add_hook shutdown_prestopdaemons splash_shutdown_pre_stop_daemons
	add_hook shutdown_prekillall     splash_shutdown_prekillall
	add_hook shutdown_poweroff       splash_shutdown_poweroff
	splash_shutdown_start() {
		# wait for X if stopped by init, override chvt to avoid loosing fadein
		if [[ $PREVLEVEL:,$SPLASH_EFFECTS, == 5:*,fadein,* ]] &&
		   ck_daemon $SPLASH_XSERVICE; then
			splash_wait Xorg
			if [[ $( fgconsole ) = $SPLASH_TTY ]]; then
				splash_msg "Switching away from splash tty to enable fadein"
				chvt 63
			fi
		fi
		# Set up step counting and start splash
		splash_svc_init shutdown
		splash  rc_init shutdown
		# Prevent gpm from garbling the splash
		if ! ck_daemon gpm; then
			splash_comm_send set gpm
			splash_comm_send repaint
		fi
	}
	splash_shutdown_pre_stop_daemons() {
		# rc.local.shutdown done
		(( SPLASH_STEPS_DONE++ ))
		splash_update_progress
	}
	splash_shutdown_prekillall() {
		[[ -r $spl_pidfile ]] && add_omit_pids $( <$spl_pidfile )
	}
	splash_shutdown_poweroff() {
		SPLASH_STEPS_DONE=$SPLASH_STEPS
		splash_update_progress
		# Stop the splash
		SPLASH_EXIT_TYPE=staysilent splash rc_exit
	}
esac

# EOF #
