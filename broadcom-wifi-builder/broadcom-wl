#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

readonly MODULES_LOCATION="/lib/modules"
readonly MODULES_BUILD="build"
readonly MODULES_KERNEL="kernel"
readonly MODULES_EXTRA="extramodules"

readonly WL_SOURCES="/usr/src/broadcom-wl"

LOG="/var/log/broadcom-wl-install.log"
FORCE=0
build_module() {
	local KVERSION=$1
	local KBUILD="${MODULES_LOCATION}/${KVERSION}/${MODULES_BUILD}"

	echo " >>> Target kernel version: ${KVERSION}" >> $LOG
	local NEED_ATTENTION=0
	local BUILD_FAIL=0

	remove_module ${KVERSION}

	WD=`pwd`
	cd "${WL_SOURCES}"

	stat_busy "Building module for ${KVERSION}: wl"
	echo "[Building wl at `date` for ${KVERSION}]" >> $LOG
	KBUILD_NOPEDANTIC=1 make API=WEXT -C ${KBUILD} M=`pwd` >> $LOG 2>&1
	[ $? -eq 0 ] && stat_done || { stat_fail; NEED_ATTENTION=1; BUILD_FAIL=1; }

	if [ $BUILD_FAIL -lt 1 ]; then
		local INSTALLDEST=${MODULES_KERNEL}
		if [ -f "${MODULES_LOCATION}/${KVERSION}/${MODULES_EXTRA}/version" ]; then
			INSTALLDEST=${MODULES_EXTRA}
		fi

		stat_busy "Installing module in ${KVERSION}: wl"
		rm -f ${MODULES_LOCATION}/${KVERSION}/${INSTALLDEST}/drivers/net/wireless/wl.{ko,ko.gz} > /dev/null 2>&1
		install -D -m 644 wl.ko ${MODULES_LOCATION}/${KVERSION}/${INSTALLDEST}/drivers/net/wireless/wl.ko && stat_done || stat_fail

		stat_busy "Compressing module in ${KVERSION}: wl"
		gzip ${MODULES_LOCATION}/${KVERSION}/${INSTALLDEST}/drivers/net/wireless/wl.ko && stat_done || stat_fail
	fi

	stat_busy "Cleaning up sources"
	echo "[Cleaning wl at `date`]" >> $LOG
	KBUILD_NOPEDANTIC=1 make API=WEXT -C ${KBUILD} M=`pwd` clean >> $LOG 2>&1
	[ $? -eq 0 ] && stat_done || { stat_fail; NEED_ATTENTION=1; }

	cd "$WD"

	if [ $BUILD_FAIL -lt 1 ]; then
		stat_busy "Updating module dependencies for ${KVERSION}"
		depmod ${KVERSION} && stat_done || stat_fail

		if [ "${KVERSION}" = `uname -r` ]; then
			if grep -q "^b43" /proc/modules; then
				stat_busy "Unloading module: b43"
				modprobe -r b43 && stat_done || stat_fail
			fi

			if grep -q "^ssb" /proc/modules; then
				stat_busy "Unloading module: ssb"
				modprobe -r ssb && stat_done || stat_fail
			fi

			if grep -q "^bcma" /proc/modules; then
				stat_busy "Unloading module: bcma"
				modprobe -r bcma && stat_done || stat_fail
			fi

			stat_busy "Loading module: wl"
			modprobe wl && stat_done || stat_fail
		fi
	fi

	return ${NEED_ATTENTION}
}

check_makefile() {
	local KVERSION=$1
	local KMOD="${MODULES_LOCATION}/${KVERSION}"
	local KBUILD="${KMOD}/${MODULES_BUILD}"
	if [ ! -f "${KBUILD}/Makefile" ]; then
		if [ $2 -gt 0 ]; then
			echo "Kernel Makefile for version ${KVERSION} is missing."
			echo "Please check it again."
			exit 1
		else
			return 1
		fi
	fi
}

remove_module() {
	local KVERSION=$1
	local KMOD="${MODULES_LOCATION}/${KVERSION}"

	if [ "${KVERSION}" = `uname -r` ]; then
		stat_busy "Working on current kernel version ${KVERSION}. Unloading module: wl"
		if grep -q "^wl" /proc/modules; then
			modprobe -r wl
		fi
		stat_done
	fi

	stat_busy "Removing module form ${KVERSION}: wl"
	rm -f ${KMOD}/{${MODULES_KERNEL},${MODULES_EXTRA}}/drivers/net/wireless/wl.{ko,ko.gz} 2>/dev/null
	rmdir -p --ignore-fail-on-non-empty ${KMOD}/{${MODULES_KERNEL},${MODULES_EXTRA}}/drivers/net/wireless/ 2>/dev/null
	stat_done
}

case "$1" in
setup)
	if [ ! -z $2 ]; then
		KVERSION=$2
	else
		KVERSION=`uname -r`
	fi

	echo "Single processing stated." > $LOG
	check_makefile $KVERSION 1
	build_module $KVERSION

	if [ $? -gt 0 ]; then
		echo "Errors occured. Please see $LOG for more information."
	fi
;;
install|rebuild)
	[ "$1" = "rebuild" ] && FORCE=1
	ERRORS=0
	echo "Batch processing stated." > $LOG
	for p in ${MODULES_LOCATION}/*; do
		KVERSION=`basename $p`

		INSTALLDEST=${MODULES_KERNEL}
		if [ -f "${MODULES_LOCATION}/${KVERSION}/${MODULES_EXTRA}/version" ]; then
			INSTALLDEST=${MODULES_EXTRA}
		fi
		if [ ${FORCE} -lt 1 ]; then
			if [ -f "${MODULES_LOCATION}/${KVERSION}/${INSTALLDEST}/drivers/net/wireless/wl.ko.gz" ]; then
				continue
			fi
		fi

		check_makefile $KVERSION 0 || continue
		build_module $KVERSION
		ERRORS=`expr $ERRORS + $?`
	done
	if [ $ERRORS -gt 0 ]; then
		echo "Errors occured. Please see $LOG for more information."
	fi
;;
clean|uninstall)
	[ "$1" = "uninstall" ] && FORCE=1
	for p in ${MODULES_LOCATION}/*; do
		KVERSION=`basename $p`
		if [ $FORCE -lt 1 ]; then
			if [ -f "$p/modules.dep" ]; then
				continue
			fi
		fi
		remove_module ${KVERSION}
		if [ -f "$p/modules.dep" ]; then
			stat_busy "Updating module dependencies for `basename ${KVERSION}`"
			depmod ${KVERSION} && stat_done || stat_fail
		fi
	done
;;
*)
	echo "usage: $0 {setup|install|rebuild|uninstall|clean}"
	echo "Also, to build module for different kernel use: $0 setup <kernel version>"
;;
esac

