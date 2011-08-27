#!/bin/bash

LIBDIR=/opt/tremulous
DATADIR=/opt

BINARY=$LIBDIR/tremfusion/$(basename $0)
BASE_PATH="$DATADIR/tremulous"
EXTRA_PATH="$DATADIR/tremfusion"
QUIET=0

# TremFusion binaries don't understand "regular" command line parameters. Let's
# catch them here, to avoid accidently launching the binary.

while [ "$1" != "" ]; do {
	if [ "$1" = "+set" -o "$1" = "+connect" ]; then
		break;
	fi
	case "$1" in
		-q|--quiet)
			QUIET=1
			;;
	esac
	shift
}; done

# Ready to rumble!

if [ ${QUIET} -eq 1 ]; then
	exec ${BINARY} +set fs_basepath ${BASE_PATH} +set fs_extrapath ${EXTRA_PATH} $* >/dev/null 2>&1
else
	exec ${BINARY} +set fs_basepath ${BASE_PATH} +set fs_extrapath ${EXTRA_PATH} $*
fi

exit $?
