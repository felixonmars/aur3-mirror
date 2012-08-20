#!/bin/bash

. ~/etc/rc.conf
. ~/etc/rc.d/functions
. ~/etc/conf.d/profile-sync

p_daemons="$HOME/var/run/daemons"
p_pid="$HOME/var/run/profile-sync.pid"
[[ -f $p_pid ]] && PID=$(cat $p_pid)
[[ -d /proc/$PID ]] || PID=""

declare -A PROFILE=(
	[chromium]="$HOME/.config/chromium" 
	[google-chrome]="$HOME/.config/google-chrome"
	[midori]="$HOME/.config/midori"
	[mozilla]="$HOME/.mozilla"
	[opera]="$HOME/.opera")

declare -A PROG=(
	[chromium]="chromium"
	[google-chrome]="google-chromium"
	[midori]="midori"
	[mozilla]="firefox"
	[opera]="opera")

declare -A RSYNC_OPTS=(
	[chromium]=""
	[google-chrome]=""
	[midori]="midori"
	[mozilla]="--exclude firefox/*/Cache"
	[opera]="opera")

# e.g. can't do sync when chromium is running.
check_run() {
	prog=${PROG[$1]}

	if [[ -n $(pidof $prog) ]]; then
		echo "${C_FAIL}ERROR${C_CLEAR} $1 is running." 1>&2
		echo 1
	else
		echo 0
	fi
}

sync() {
	# sync profiles to tmpfs and back again
	for b in $BROWSERS; do
		profile=${PROFILE[$b]}
		profile_ref="${profile}-ref"
		p_volatile_dir="$VOLATILE/$USER-$b"

		# check if user has browser profile
		if [[ ! -d $profile ]]; then
			continue
		fi

		[[ -r $p_volatile_dir ]] || install -dm755 $p_volatile_dir

		# backup profile and link to tmpfs
		if [[ $(readlink "$profile") != $p_volatile_dir ]]; then
			mv $profile $profile_ref
			ln -s $p_volatile_dir "$profile"
		fi

		# sync the RAM profile to the disc
		if [[ -e $profile/.flagged ]]; then
			rsync -a --delete --exclude .flagged ${RSYNC_OPTS[$b]} $profile/ $profile_ref/
		else
			rsync -a ${RSYNC_OPTS[$b]} $profile_ref/ $profile/
			touch $profile/.flagged
		fi
	done
}

foo(){
	PROG="chromium"
}

recovery() {
	# crash recovery
	for b in $BROWSERS; do
		profile=${PROFILE[$b]}
		profile_ref="${profile}-ref"

		# chromium/ chromium-ref/
		[[ -d $profile && -d $profile_ref ]] && rm -r $profile_ref && echo "RECOVERY: rm -r $profile_ref"

		# chrmomim@ chromium-ref/
		[[ -h $profile && -d $profile_ref ]] && rm -f $profile && mv $profile_ref $profile && echo "RECOVERY: rm -f $profile"

		# chromium@ 
		# can't happen
	done
}

unsync() {
	# restore virgin state of profiles on physical discs
	for b in $BROWSERS; do
		profile=${PROFILE[$b]}
		profile_ref="${profile}-ref"
		p_volatile_dir="$VOLATILE/$USER-$b"

		# check if user has browser profile
		if [[ -h $profile ]]; then
			rm -f $profile
			[[ -d $profile_ref ]] && mv $profile_ref $profile
			[[ -d $p_volatile_dir ]] && rm -rf $p_volatile_dir
		fi
	done
}

case "$1" in
  start)
    stat_busy "Starting profile-sync daemon"

    if [[ -z "$PID" ]]; then
			for b in $BROWSERS; do
				[[ $(check_run $b) == 1 ]] && stat_fail && exit 1
			done

			recovery
			sync

			sleep 9999d &
      echo $! > $p_pid

		else
			echo "${C_OTHER}SKIP${C_CLEAR} profile-sync is already running."
		fi

		add_daemon profile-sync
		stat_done
    ;;
  stop)
    stat_busy "Stopping profile-sync daemon"

		if [[ -n "$PID" ]]; then 
			sync 
			for b in $BROWSERS; do
				[[ $(check_run $b) == 1 ]] && stat_fail && exit 1
			done
			unsync

			kill -KILL $PID &>/dev/null
      rm $p_pid

		else
			echo "${C_OTHER}SKIP${C_CLEAR} profile-sync is not running."
		fi

		rm_daemon profile-sync
		stat_done
		;;
	sync)
		stat_busy "Syncing profile-sync"

		if [[ -n "$PID" ]]; then 
			sync
		else
			echo "${C_FAIL}ERROR${C_CLEAR} profile-sync is not running."
			stat_fail && exit 1
		fi

		stat_done
		;;	
  restart)
    $0 stop
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart|sync}"
esac
exit 0
