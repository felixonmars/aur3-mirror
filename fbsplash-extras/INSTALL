#!/bin/bash

# arg 1:  the old package version
pre_remove() {
	pre_install
}

# arg 1:  the new package version
# arg 2:  the old package version
pre_upgrade() {
	pre_install
}

# arg 1:  the new package version
pre_install() {
	local error=0 output=""
	# Move the splash cache directory on behalf of fbsplash (which expects it to be empty)
	# to allow /lib/ to be replaced by a symlink when updating glibc to 2.16.0-2 or later.
	# Files laying around here (from previous versions) could simply be deleted, but who knows...
	if [[ ! -h lib ]]; then
		local d dd
		for d in lib/splash/cache; do
			[[ -d $d ]] || continue
			# Try hard to unmount any stale tmpfs
			for dd in $d usr/$d; do
				while findmnt -t tmpfs $dd >/dev/null; do
					output+=$'\n> '$( umount -l $dd 2>&1 && echo "Unmounted '$dd'"  ) && continue
					error=1
					break 3
				done
			done
			output+=$'\n> '$( mv -v -T $d usr/$d 2>&1 ) || error=1
		done
		local dir_list
		dir_list=$( [[ -d lib/splash ]] && find lib/splash -type d | tac ) &&
		while read -r d; do
			output+=$'\n> '$( rmdir -v "${d}" 2>&1 ) || error=1
		done <<< "${dir_list}"
	fi
	# Move the persistent data dir
	# Not using /var/ because it might not be available during early boot
	# Not using /usr/ because it should only contain read-only stuff shareable between multible hosts
	local d
	for d in lib/fbsplash-controld; do
		[[ -d $d ]] || continue
		output+=$'\n> '$( mv -v -T $d etc/fbsplash-extras 2>&1 ) || error=1
	done

	if [[ $output ]]; then
		cat <<-EOT
		-------------------------------------------------------------------------------
		> Move cache directories to new location and remove /lib/splash:${output}
		-------------------------------------------------------------------------------
		EOT
	fi
	return $error
}


# arg 1:  the old package version
post_remove() {
	:
}

# arg 1:  the new package version
# arg 2:  the old package version
post_upgrade() {
	if (( $( vercmp "$2" 3.0 ) < 0 )); then
		post_install
	fi
}

# arg 1:  the new package version
post_install() {
	cat <<-EOT
		-------------------------------------------------------------------------------
		> If starting X from DAEMONS, set SPLASH_XSERVICE in /etc/conf.d/splash !
		> Additional configuration: /etc/conf.d/splash-extras
		> If SPLASH_DAEMON="early" in /etc/conf.d/splash, update your initcpio !
		> *WARNING* - Setting a console font on the kernel command line or in
		> /etc/rc.conf or /etc/vconsole.conf might break the splash screen !
		-------------------------------------------------------------------------------
	EOT
}

# EOF
