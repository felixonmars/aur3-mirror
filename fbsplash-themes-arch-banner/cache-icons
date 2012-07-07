#!/bin/bash

# cache-icons
#

icon_count=13
icon_size=32
icon_size_small=16
images=/usr/share/fbsplash-themes-arch-banner/images

# Directory from which the splash daemon loads
# variable theme files (services icons) at startup
# which need to be available after mounting the
# splash cache even without theme hook script support
work_dir=/etc/splash/$SPLASH_THEME/cache
# Directory where temporary hook data files are stored
# which need to be moved in by the initcpio hook
work_dir_hooks=$spl_cachedir/hook-data-$SPLASH_THEME

work_dir_umount() {
	while mountpoint -q "${work_dir}"; do
		umount "$@" -l "${work_dir}"
	done
}

set -e
case $1
in install | uninstall ) # run by pacman package install script
	work_dir=${work_dir#/}
	( cd "${work_dir%/*}" ) # verify theme dir is there
	work_dir_umount
	rm -rf "${work_dir}"
	[[ $1 = uninstall ]] && exit
;; sysinit | shutdown | reboot | suspend )
;; * ) # "rc_init boot"
	exit
esac
if [[ $1 = install ]]; then
	mkdir "${work_dir}"
elif [[ $0 = */rc_init-post ]]; then
	# This does nothing, if the splash daemon was started in the initcpio.
	work_dir_umount -n
	exit
else
	mount -n -s -t tmpfs cachedir "${work_dir}" -o rw,mode=0755,noexec,nosuid,nodev,size=4096k
fi
set +e

# Link invisible dummy icons
# Status emblems
for state in start stop fail; do
	ln -sfT $images/dummy.png "${work_dir}"/${state}
	ln -sfT $images/dummy.png "${work_dir}"/cover-${state}
done
# Service icons
for (( num=1; num<=icon_count; num++ )) do
	ln -sfT $images/dummy.png "${work_dir}"/svc_${num}_start
	ln -sfT $images/dummy.png "${work_dir}"/svc_${num}_stop
done

[[ $1 = install ]] && exit 0

ICON_THEME=/usr/share/icons/Tango
. /etc/splash/$SPLASH_THEME/icons.conf
[[ $ICON_THEME = /* ]] || ICON_THEME=/usr/share/icons/$ICON_THEME

# args: <icon-rel-path> <symlink-name>
ln_svcicon() {
	if [[ -f $ICON_THEME/$ICON_SIZE/${1} ]]; then
		ln -sfT "$ICON_THEME/$ICON_SIZE/${1}" "${work_dir}/${2}"
	else
		echo "${0}: File not found: '$ICON_THEME/$ICON_SIZE/${1}'" >&2
		return 1
	fi
}

# Link status emblem icons if available or enable semi transparent covers

ICON_SIZE=${icon_size_small}x${icon_size_small}
if ! [[ $ICON_start ]] || ! ln_svcicon "${ICON_start}" start; then
	ln -sfT $images/cover-a50.png "${work_dir}"/cover-start
	ln -sfT $images/cover-a50.png "${work_dir}"/cover-fail
fi
if ! [[ $ICON_stop ]] || ! ln_svcicon "${ICON_stop}" stop; then
	ln -sfT $images/cover-a50.png "${work_dir}"/cover-stop
	ln -sfT $images/cover-a50.png "${work_dir}"/cover-fail
fi
if ! [[ $ICON_fail  ]] || ! ln_svcicon "$ICON_fail" fail; then
	ln -sfT $images/cover-a50.png "${work_dir}"/cover-fail
fi

# Link service icons and save positions for fast lookup

ICON_SIZE=${icon_size}x${icon_size}

declare -A SERVICE_ICONS_AA=()
for (( i=0; i<${#SERVICE_ICONS[@]}; i+=2 )) do
	svc=${SERVICE_ICONS[i]}
	icon=${SERVICE_ICONS[i+1]}
	SERVICE_ICONS_AA[$svc]+=" ${icon}"
done

# Get first existing icon for service from configuration
# args: <svc>
svcicon_get() {
	local icon icons=${SERVICE_ICONS_AA[$1]}
	for icon in $icons; do
		[[ -f $ICON_THEME/$ICON_SIZE/$icon ]] || continue
		echo "${icon}"
		return
	done
	for icon in $icons; do
		echo "${0}: File not found: '$ICON_THEME/$ICON_SIZE/${icon}'" >&2
	done
	return 1
}

# splash_manager runs us without a tmpfs mounted
mkdir -p "${work_dir_hooks}"
rm -f "${work_dir_hooks}"/svcicon_num_*

# args: <service-name> start|stop
svc_icon_num() {
	local svc=$1 icon
	icon=$( svcicon_get "${svc}" ) || return 0
	ln_svcicon "${icon}" svc_$(( ++ICON_NUM  ))_$2
	echo $ICON_NUM >|"${work_dir_hooks}"/svcicon_num_"${svc}"_$2
}
# Note: If no UDev in initcpio, process substitution doesn't work
splash_svclist_get stop > "${work_dir}"/svcs_stop
readarray -t svclist < "${work_dir}"/svcs_stop
ICON_NUM=0
for (( i=${#svclist[@]}-1; i>=0; i-- )) do
	svc_icon_num "${svclist[i]}" stop
done
splash_svclist_get start > "${work_dir}"/svcs_start
readarray -t svclist < "${work_dir}"/svcs_start
ICON_NUM=0
for svc in "${svclist[@]}"; do
	svc_icon_num "${svc}" start
done

# EOF #
