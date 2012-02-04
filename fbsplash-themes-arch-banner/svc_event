#!/bin/bash

# svc_event
# args: <svc-name>
#

# Allow to source this for speed even when symlinked
hook_name=${SPLASH_HOOK:-${0##*/}}
event=${hook_name%-*}

work_dir_hooks=$spl_cachedir/hook-data-$SPLASH_THEME

# Lookup icon position for service
if [[ $event = svc_stop* ]]
then num_file=$work_dir_hooks/svcicon_num_${1}_stop
else num_file=$work_dir_hooks/svcicon_num_${1}_start
fi
if [[ -f $num_file ]]; then
	read num <"${num_file}"
	# Avoid writing to profile
	# Hooks are also run by splash_manager replay, so
	# there is no need to include things done here
	# and we don't want it to append something to the profile.
	unset SPLASH_PROFILE
	splash_comm_send update_svc _icon_svc_"${num}" $event
fi
