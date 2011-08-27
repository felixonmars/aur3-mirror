#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

LOG="/var/log/tp_smpai-install.log"

case "$1" in
setup)
	echo "Target system: `uname -s` `uname -r`" > $LOG
	NEED_ATTENTION=0
	for MOD in tp_smapi thinkpad_ec; do
		stat_busy "Unloading module: ${MOD}"
		if grep -q "^${MOD}" /proc/modules; then
			modprobe -r ${MOD}
		fi
		stat_done
	done

	WD=`pwd`
	cd /usr/src/tp_smapi

	stat_busy "Building modules"
	echo "[Building modules at `date`]" >> $LOG
	make >> $LOG 2>&1
	[ $? -eq 0 ] && stat_done || { stat_fail; NEED_ATTENTION=1; }
	
	for MOD in thinkpad_ec tp_smapi; do
		stat_busy "Installing module ${MOD} in `uname -r`"
		rm -f /lib/modules/$(uname -r)/extra/${MOD}.ko > /dev/null 2>&1
		install -D -m 644 ${MOD}.ko /lib/modules/$(uname -r)/extra/${MOD}.ko && stat_done || stat_fail
	done

	stat_busy "Cleaning up sources"
	echo "[Cleaning modules at `date`]" >> $LOG
	KBUILD_NOPEDANTIC=1 make -C /lib/modules/$(uname -r)/build M=`pwd` clean >> $LOG 2>&1
	[ $? -eq 0 ] && stat_done || { stat_fail; NEED_ATTENTION=1; }

	cd "$WD"

	stat_busy "Updating module dependencies for `uname -r`"
	depmod $(uname -r) && stat_done || stat_fail

	if [ $NEED_ATTENTION -gt 0 ]; then
		echo "Errors occured. Please see $LOG for more information."
	else
		stat_busy "Loading modules"
		modprobe tp_smapi && stat_done || stat_fail
	fi
;;
clean)
	for p in /lib/modules/*; do
		if [ ! -f "$p/modules.builtin" ]; then
			if [ -e "$p/extra/tp_smapi.ko" ] || [ -e "$p/extra/tp_smapi.ko" ]; then
				stat_busy "Removing old modules form $p"
				rm -f "$p/extra/tp_smapi.ko" 2>/dev/null
				rm -f "$p/extra/thinkpad_ec.ko" 2>/dev/null
				rmdir -p --ignore-fail-on-non-empty "$p/extra/" 2>/dev/null
				stat_done
			fi
		fi
	done
;;
*)
	echo "usage: $0 {setup|clean}"
;;
esac

