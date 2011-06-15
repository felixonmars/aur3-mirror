
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

## Parameters for the time based part of shutdown progress (miliseconds)

SPLASH_SLEEP_INTERVAL=500
# sum of the rc.shutdown SIGTERM/SIGKILL sleeps devided by the interval
SPLASH_SLEEP_STEPS=$(( ( 5000 + 1000 ) / SPLASH_SLEEP_INTERVAL ))

## Set up splash-functions and configuration

# Only do this where needed,
# since we use BASH, all important functions and variables are exported.
if ! [[ $( type -t splash_setup ) = function ]]; then
	# splash-functions.sh will run splash_setup which needs /proc
	# code line copied from /etc/rc.sysinit
	/bin/mountpoint -q /proc || /bin/mount -n -t proc proc /proc -o nosuid,noexec,nodev
	export SPLASH_PUSH_MESSAGES SPLASH_VERBOSE_ON_ERRORS
	# /etc/conf.d/splash is also sourced by this
	. /sbin/splash-functions.sh
	# eliminate some non local vars from splash_setup    ## FIXME ##
	unset options opt i
fi

typeset -A SPLASH_STEPS_BUSY

## Extra functions

# Get a (rough) list of 'services' to start/stop from given initscript,
# set up busy steps assoc. array and count steps
# for triggering splash progress and events
splash_initscript_svcs_get() {        # args: <initscript> ['list']
	local fd line msg svc
	exec {fd}<"$1" || return
	while read -u $fd line ; do
		# Daemon start/stop with literal daemon name (for customized rc.{sysinit,shutdown})
		if [[ $line =~ (^|[[:space:]])(start|stop)_(daemon|daemon_bkgd)[[:space:]]+([^\$[:space:]]+)([[:space:]]|$) ]]; then
			svc=${BASH_REMATCH[4]}
			msg="${BASH_REMATCH[2]}_${BASH_REMATCH[3]} $svc" # command string
			# Do not print nor count backgrounded
			if [[ ${BASH_REMATCH[3]} == daemon_bkgd ]]; then
				[[ $2 = list ]] && continue
			else
				(( SPLASH_STEPS++ ))
			fi
		else
			# Busy-Message
			[[ $line =~ (^|[[:space:]])(stat_busy|status)[[:space:]]+(\"([^\"]+)\")? ]] || continue
			msg=${BASH_REMATCH[4]}
			# Sort out skipped
			case $msg
			in *SIGTERM* | *SIGKILL* ) continue # time based progress
			esac
			# Generate a 'service' name
			svc=$( splash_msg_to_svc "$msg" )
			# Skip ignored steps and any dupes
			[[ ${SPLASH_STEPS_BUSY[$svc]} ]] && continue
			# Set up busy steps assoc. array
			SPLASH_STEPS_BUSY[$svc]=$((++SPLASH_STEPS))
		fi
		# Print full list
		case ${2} in list )
			echo $SPLASH_STEPS $svc "$msg"
			continue
		esac
		# Sort out some inactive
		# ignoring /proc, /sys and kernel parameters which might be not mounted (or wrong if mkinitcpio)
		case $msg
		in "Loading Modules"      ) [[ ${MODULES[@]/!*/} ]]
		;; *SoftRAID*             ) [[ $USEMDADM  =~ yes|YES && -x /sbin/mdadm  ]]
		;; *FakeRAID*             ) [[ $USEDMRAID =~ yes|YES && -x /sbin/dmraid ]]
		;; *BTRFS*                ) [[ $USEBTRFS  =~ yes|YES && -x /sbin/btrfs  ]]
		;; *LVM2*                 ) [[ $USELVM    =~ yes|YES && -x /sbin/lvm    ]]
		;; *encrypted*            ) splash_test_file -f /etc/crypttab
		;; "Checking Filesystems" ) [[ -x /sbin/fsck ]]
		;; *"Time Zone"*          ) [[ $TIMEZONE ]]
		;; "Setting Hostname"*    ) [[ $HOSTNAME ]]
		;; "Setting NIS Domain Name"* )
			( [[ -r /etc/conf.d/nisdomainname ]] && . /etc/conf.d/nisdomainname; [[ $NISDOMAINNAME ]] )
		;; "Loading Keyboard Map"* ) [[ $KEYMAP ]]
		;; "Setting Consoles to UTF-8 mode"  )   [[ ${LOCALE,,} =~ utf ]]
		;; "Setting Consoles to legacy mode" ) ! [[ ${LOCALE,,} =~ utf ]]
		;; "Adding persistent cdrom udev rules" )
			[ -f /dev/.udev/tmp-rules--70-persistent-cd.rules ]
		;; "Adding persistent network udev rules" )
			[ -f /dev/.udev/tmp-rules--70-persistent-net.rules ]
		esac || continue
		# echo a service name
		echo $svc
	done
	exec {fd}<&-
}

# Test a file and check if it contains any significant lines
splash_test_file() {            # args: <test-operator> <file> [<regex>]
	local regex=${3:-'[[:space:]]*[^#[:space:]].*'}
	test ${1} "${2}" && [[ $( <"${2}" ) =~ (^|$'\n')${regex}($'\n'|$) ]]
}

# Generate a 'service' name from a initscript stat_busy message text
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
	# Fix remaining non-matches
	case $svc
	in   mount_filesystems ) svc=mount_local_filesystems
	esac
	# Use some 'namespace' to allow distinguishing from daemons
	echo _init_$svc
}

# Write list file for splash_svclist_get,
# set up progress steps assoc. array and count steps
splash_svc_init() {
	splash_profile info splash_svc_init $1
	case $1
	in sysinit )
		SPLASH_STEPS=0
		SPLASH_STEPS_BUSY=()
		# rc.sysinit 'services'
		splash_initscript_svcs_get /etc/rc.sysinit >|$spl_cachedir/svcs_start
		echo $SPLASH_STEPS >|$spl_cachedir/steps_sysinit
		# save assoc. array in case we're called from mkinitcpio
		(
			echo 'SPLASH_STEPS_BUSY=('
			for key in "${!SPLASH_STEPS_BUSY[@]}"; do
				echo "  ['$key']=${SPLASH_STEPS_BUSY[$key]}"
			done
			echo ')'
		) >|$spl_cachedir/steps_busy.bash
		# rc.multi services
		(( SPLASH_STEPS++ )) # rc.local
		local daemon
		for daemon in "${DAEMONS[@]}"; do
			case $daemon
			in $SPLASH_XSERVICE | '@'$SPLASH_XSERVICE )
				(( SPLASH_STEPS-- )) # revert rc.local
				break
			;; '!'* ) continue
			;; '@'* ) :
			;;    * ) (( SPLASH_STEPS++ ))
			esac
			echo ${daemon#@}
		done >>$spl_cachedir/svcs_start
		echo $SPLASH_STEPS >|$spl_cachedir/steps_bootup
	;; shutdown )
		SPLASH_STEPS=0
		SPLASH_STEPS_BUSY=()
		local daemon
		# daemons NOT in the DAEMONS array are shut down first
		for daemon in /run/daemons/*; do
			[[ -f $daemon ]] || continue
			daemon=${daemon##*/}
			in_array "$daemon" "${DAEMONS[@]}" && continue
			(( SPLASH_STEPS++ ))
			echo "$daemon"
		done >|$spl_cachedir/svcs_stop
		# remaining daemons in reverse order
		local i
		for (( i=${#DAEMONS[@]}-1; i>=0; i-- )) do
			[[ ${DAEMONS[i]} == '!'* ]] && continue
			daemon=${DAEMONS[i]#@}
			ck_daemon "$daemon" && continue
			(( SPLASH_STEPS++ ))
			echo "$daemon"
		done >>$spl_cachedir/svcs_stop
		(( SPLASH_STEPS+=SPLASH_SLEEP_STEPS ))
		# rc.shutdown 'services'
		splash_initscript_svcs_get /etc/rc.shutdown >>$spl_cachedir/svcs_stop
	esac
}

splash_busy_step() {
	local step=${SPLASH_STEPS_BUSY[$SPLASH_BUSY_SVC]}
	# ignore the step if splash not yet started
	# or if empty SPLASH_STEPS_BUSY (not exported!)
	if [[ -z $step ]]; then
		SPLASH_STEPS_BUSY[$SPLASH_BUSY_SVC]=0
	elif (( step > SPLASH_STEPS_DONE )); then
		SPLASH_STEPS_DONE=$step
		splash_update_progress
	fi
}

# Function for preparing a cache (faking sysinit) for adding it to an initcpio
splash_cache_prep_initcpio() {
	(
		SPLASH_MODE_REQ=silent
		export PREVLEVEL=N RUNLEVEL=S
		. /etc/rc.conf
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
		# not using splash_cache_cleanup - fails silently in chroot because of mount --move
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
		[[ $spl_cachedir ]] && cd "$spl_cachedir" && /bin/mountpoint -q . || exit 1
		file=$1; shift
		if (( $# > 0 )); then echo "$@"; fi >>"${file}"
	)
}

splash_msg() {
	splash_profile "info" "$@"
	echo "fbsplash-extras:" "$@"
}

# Run theme hook script (if any)
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

# Deactivate splash and maybe prepare X start
splash_exit_boot() {
	if /bin/mountpoint -q $spl_cachedir; then
		SPLASH_STEPS_DONE=$SPLASH_STEPS
		splash_update_progress
		# Stop splash (or just run theme hooks in case of sysinit)
		splash rc_exit
		# The infamous blah-blah...
		set_consolefont
	# Prevent X from doing a chvt back to uggly console on exit
	elif [[ $SPLASH_EXIT_TYPE = staysilent && $( /usr/bin/fgconsole ) != $SPLASH_TTY ]]; then
		splash_msg "Switching to splash tty for starting X"; chvt $SPLASH_TTY
	fi
}

# Wait until timeout or given binary dies
splash_wait() {
	local i
	for (( i=0; i<100; i++ )); do
		[[ $( /bin/pidof -o %PPID "${1}" ) ]] || return 0
		/bin/sleep .1
	done
	splash_msg "Timeout waiting on '$1' to die!"
	return 1
}

# Get a file descriptor and start a daemon for pushing progress info
# from 'fsck -C$FSCK_FD' to the splash status message line
splash_fsck_push_d() {
	[[ -w $spl_fifo && $( /bin/pidof -o %PPID $spl_daemon ) ]] || return
	local fsck_fifo=$spl_cachedir/fsck_fifo
	# drop any old fifo and create a new one
	/bin/rm -f $fsck_fifo && /bin/mkfifo -m 600 $fsck_fifo || return
	(
		spl_pgr=$(( 65535 * SPLASH_STEPS_DONE / SPLASH_STEPS ))
		spl_pgr_pid=""
		fsck_pgr=-1
		fsck_pgr_msg=""
		fsck_comm_pid=""
		while :; do
			read -t 2 phase step total fs; ret=$?
			if (( ret == 0 )); then
				new_pgr=$(( 100 * step / total ))
				(( new_pgr == fsck_pgr )) && continue
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
				if (( ret <= 128 )); then # not a timeout
					break
				elif (( fsck_pgr >= 100 )); then # timeout and phase complete
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
		splash_comm_send set message "$( splash_get_boot_message )"
	) &>/dev/null <$fsck_fifo &
	exec {FSCK_FD}>$fsck_fifo
}

splash_start_daemon() {
	splash svc_start "$1"
	/etc/rc.d/"$1" start; local retval=$?
	if [[ -e $spl_cachedir/start_failed-$1 ]]; then
		splash svc_start_failed $1 $retval
	else
		if [[ $1 = gpm ]]; then
			splash_comm_send set gpm; splash_comm_send repaint
		fi
		splash svc_started "$1" $retval
	fi
	return $retval
}

## Don't go further if no splash is demanded (in kernel cmdline)
## 'verbose' splash mode is handled by fbcondecor kernel patch and daemon script

[[ $SPLASH_MODE_REQ = silent ]] || return 0

## Override some splash-functions

# This is the main function which handles splash events
# Allow cache tmpfs already mounted
# Don't write ugly generic messages to the splash log
# Provide a general failure status (dummy service)
# Support sourcing of theme hook scripts
# args: <event> [arg]...
splash() {
	[[ $SPLASH_MODE_REQ = off ]] && return
	local event=$1; shift
	case $event
	in   rc_init ) # args: sysinit|boot|shutdown
		if [[ $1 != boot ]]; then
			# rc_init-hooks may write some files - only allow with tmpfs mounted
			/bin/mountpoint -q $spl_cachedir || ( splash_cache_prep ) || return
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
		if [[ $SPLASH_VERBOSE_ON_ERRORS = yes ]]; then
			splash_verbose # chvt
		fi
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
# Avoiding /bin/pidof here for speed
splash_comm_send() {
	[[ -r $spl_pidfile ]] || return 1
	if ! kill -0 $( <"$spl_pidfile" ) 2>&-; then
		/bin/rm -f "$spl_pidfile"
		return 1
	fi
	splash_profile comm "$@"
	echo "$@" >$spl_fifo &
}

# Explain what's going on
splash_verbose() {
	if [[ $( $spl_bindir/fgconsole ) != 1 ]]; then
		splash_msg "Switching to console"; chvt 1
	fi
}

# Bashified for speed
splash_profile() {
	[[ $SPLASH_PROFILE = on ]] || return 0
	local time rest; read time rest </proc/uptime
	echo "$time: $*" >>$spl_cachedir/profile
}

# Finish the splash, stop the daemon and umount cache tmpfs
splash_exit() {
	if [[ $0 = /etc/rc.sysinit || $PREVLEVEL:$RUNLEVEL = N:S ]]; then
		[[ $1 = force ]] || return 0
	fi
	splash_profile info "splash_exit"
	if [[ $SPLASH_MODE_REQ = silent ]]; then
		# Reset status message
		if [[ $SPLASH_PUSH_MESSAGES = yes ]]; then
			splash_comm_send set message "$( splash_get_boot_message )"
			splash_comm_send repaint # needed if daemon started with --type other than bootup
		fi
		SPLASH_PUSH_MESSAGES="no" \
			stat_busy "Stopping Fbsplash daemon"
		local ret=1
		if [[ $( /bin/pidof -o %PPID $spl_daemon ) ]]; then
			# Let the daemon do the message update
			sleep .1
			# Fadeout/Stop the daemon
			splash_comm_send exit $SPLASH_EXIT_TYPE
			splash_wait $spl_daemon &&
				/bin/rm -f $spl_pidfile
			ret=$?
		else
			splash_msg "No Fbsplash daemon running!"
		fi
		if (( ret == 0 ))
		then stat_done; splash_profile info "splash_exit done"
		else stat_fail; splash_profile info "splash_exit failed"
		fi
	fi
	# Umount the tmpfs copying most important files to the disk
	# (for any remaining services theme hooks and also for debugging)
	splash_cache_cleanup svcs_start steps_sysinit steps_bootup
}

# Do something usefull
splash_update_progress() {
	if (( SPLASH_STEPS > 0 )); then
		splash_comm_send progress $(( 65535 * SPLASH_STEPS_DONE / SPLASH_STEPS ))
		splash_comm_send paint
	fi
}

## Override some initscripts functions

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
	splash_start_daemon "$1"; local retval=$?
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
	( SPLASH_PUSH_MESSAGES="no" SPLASH_VERBOSE_ON_ERRORS="no" \
		splash_start_daemon "$1" ) &>/dev/null &
}

stop_daemon() {
	splash svc_stop "$1"
	/etc/rc.d/"$1" stop; local retval=$?
	if [[ -e $spl_cachedir/stop_failed-$1 ]]
	then splash svc_stop_failed "$1" $retval
	else splash svc_stopped     "$1" $retval
	fi
	# Only step if SPLASH_STEPS is set (not exported!)
	if (( SPLASH_STEPS > 0 )); then
		(( SPLASH_STEPS_DONE++ ))
		splash_update_progress
	fi
	# Change to console after Xorg exit if going Singe-user or to restore 'verbose on errors'
	if [[ $1 = $SPLASH_XSERVICE && \
	    ( $0 = /etc/rc.single || \
	      $SPLASH_VERBOSE_ON_ERRORS = yes && -e $spl_cachedir/stop_failed-fbsplash-dummy ) ]]; then
		splash_wait /usr/bin/Xorg
		splash_verbose # chvt
	fi
	return $retval
}

## Activate splash in rc.{sysinit,shutdown} and then
## (or when changing between Single- and Multi-user)
## hook into initscripts

case $0
in /etc/rc.sysinit )
	# Continue to use a splash daamon started in initcpio
	if /bin/mountpoint -q /dev/.splash-cache; then
		/bin/mount --move /dev/.splash-cache $spl_cachedir || return 0
		splash_msg "Using initcpio daemon"
		splash_comm_send set message "$SPLASH_BOOT_MESSAGE"
		# if pre-rc_init hook was run from mkinitcpio, just set the variables
		if [[ -f $spl_cachedir/steps_busy.bash ]]; then
			source $spl_cachedir/steps_busy.bash # set SPLASH_STEPS_BUSY
			read SPLASH_STEPS <$spl_cachedir/steps_bootup
		else # set up step counting
			splash_svc_init sysinit
		fi
		splash_run_hook post rc_init sysinit $RUNLEVEL
	# Mount a new tmpfs and start splash ASAP
	else
		( splash_cache_prep ) || return 0
		SPLASH_START_PENDING=1
		if [[ $( /bin/pidof -o %PPID fbcondecor_helper ) ]]; then
			splash_profile info "fbcondecor_helper running"
		# Set up step counting and start splash
		# using dev-FS from initcpio or kernel devtmpfs
		elif [[ -c /dev/fb0 ]]; then
			splash_svc_init sysinit
			splash  rc_init sysinit
			unset SPLASH_START_PENDING
		# Paint the initial splash if not done in initcpio
		elif [[ $( $spl_bindir/fgconsole ) != $SPLASH_TTY ]]; then
			BOOT_MSG=$SPLASH_BOOT_MESSAGE \
				/sbin/fbcondecor_helper 2 init $SPLASH_TTY 0 $SPLASH_THEME
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
		if [[ $( /bin/pidof -o %PPID fbcondecor_helper ) ]]; then
			splash_profile info "fbcondecor_helper running"
			return
		fi
		# Just prepare devices required by the daemon before doing all udev
		if [[ $( /bin/pidof -o %PPID /sbin/udevd ) ]]; then
			splash_profile info "udevadm trigger"
			/sbin/udevadm trigger --action=add --subsystem-match={tty,graphics,input}
			/sbin/udevadm settle ${UDEV_TIMEOUT:+--timeout=$UDEV_TIMEOUT}
		fi
		if [[ -c /dev/fb0 ]]; then
			splash_svc_init sysinit
			splash  rc_init sysinit
			unset SPLASH_START_PENDING
		else
			splash_profile info "still no framebuffer device!"
		fi
	}
	splash_sysinit_udevsettled() {
		splash_profile info "sysinit_udevsettled"
		if (( ! SPLASH_START_PENDING )); then
			# Just try to grab the keyboard again - but not if started in initcpio
			if [[ ! -e /dev/.splash-cache ]]; then
				splash_set_event_dev
			fi
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
		splash_svc_init sysinit
		splash  rc_init sysinit
		unset SPLASH_START_PENDING
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
		# Just run theme hooks
		splash rc_exit
		# If we can grab it again later, release the keyboard
		# to be save in case of no rc.multi (messed inittab)
		if [[ ! -e /dev/.splash-cache ]]; then
			splash_comm_send "set event dev /dev/null"
		fi
		# If Single-user boot, drop splash and umount tmpfs to allow clean mkinitcpio
		[[ " "$( </proc/cmdline )" " =~ " "(s|S|single|1)" " ]] || return 0
		splash_exit force
		splash_verbose # chvt
		# The infamous blah-blah...
		CONSOLEFONT=$SPLASH_CONSOLEFONT set_consolefont
	}
;; /etc/rc.multi )
	if /bin/mountpoint -q $spl_cachedir; then
		read SPLASH_STEPS_DONE <$spl_cachedir/steps_sysinit
		read SPLASH_STEPS      <$spl_cachedir/steps_bootup
		# If possible, grab the keyboard again
		if [[ ! -e /dev/.splash-cache ]]; then
			splash_set_event_dev
		fi
		# Run any theme hooks
		splash rc_init boot
	fi
	add_hook multi_end splash_multi_end
	splash_multi_end() {
		# Always stop/paint/fadeout before X does chvt (black screen)
		# Even with inactive splash some chvt magic may be done
		if ! in_array "$SPLASH_XSERVICE" "${DAEMONS[@]}"; then
			if [[ $RUNLEVEL = 5 ]]
			then SPLASH_EXIT_TYPE=staysilent splash_exit_boot
			else splash_exit_boot
			fi
		fi
	}
;; /etc/rc.single )
	[[ $PREVLEVEL = N ]] && return 0
	# Just override X exit chvt to avoid black screen,
	# but only do it here if stop_daemon doesn't
	if ! [[ $( /bin/pidof -o %PPID /usr/bin/Xorg ) ]]; then
		splash_verbose # chvt
	elif ck_daemon "$SPLASH_XSERVICE"; then
		add_hook single_postkillall splash_single_postkillall
	fi
	splash_single_postkillall() {
		splash_wait /usr/bin/Xorg
		splash_verbose # chvt
	}
;; /etc/rc.shutdown )
	( splash_cache_prep ) || return 0
	# No deferred start on SPLASH_XSERVICE to avoid missing errors
	# X should chvt back to SPLASH_TTY and we don't do daemons progress
	add_hook shutdown_start       splash_shutdown_start
	add_hook shutdown_prekillall  splash_shutdown_prekillall
	add_hook shutdown_postkillall splash_shutdown_postkillall
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
		# Set up step counting and start splash
		splash_svc_init shutdown
		splash  rc_init shutdown
		# Prevent gpm from garbling the splash
		if ! ck_daemon gpm; then
			splash_comm_send set gpm; splash_comm_send repaint
		fi
	}
	splash_shutdown_prekillall() {
		if [[ -r $spl_pidfile ]]; then
			add_omit_pids $( <$spl_pidfile )
			# Time based part of shutdown progress
			(
				# format miliseconds to [n]n.nnn seconds
				s=$( printf "%.4d" $SPLASH_SLEEP_INTERVAL )
				s=${s%???}.${s:((-3))}
				for (( i=0; i<SPLASH_SLEEP_STEPS; i++ )) do
					/bin/sleep $s
					(( SPLASH_STEPS_DONE++ ))
					splash_update_progress
				done
			) &
			splash_sleep_pid=$!
			add_omit_pids $splash_sleep_pid
		fi
	}
	splash_shutdown_postkillall() {
		wait $splash_sleep_pid
		(( SPLASH_STEPS_DONE+=SPLASH_SLEEP_STEPS ))
	}
	splash_shutdown_poweroff() {
		SPLASH_STEPS_DONE=$SPLASH_STEPS
		splash_update_progress
		# Stop the splash
		SPLASH_EXIT_TYPE=staysilent splash rc_exit
	}
esac

# EOF #
