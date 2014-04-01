#!/bin/sh
#set -x

# Settings
LIB_BASE=/usr/lib
LIB32_BASE=/usr/lib32
LIBGLX_BASE=${LIB_BASE}/xorg/modules/extensions
XORG_CONF=/etc/X11/xorg.conf
#MESA
MESA_LIB_BASE=/usr/lib/mesa
MESA_LIB_PREFIX=
MESA32_LIB_BASE=/usr/lib32/mesa
MESA32_LIB_PREFIX=
MESA_XORG='/usr/lib/xorg/modules/extensions/libglx.xorg'
#NVIDIA
NVIDIA_LIB_BASE=/usr/lib/nvidia
NVIDIA_LIB_PREFIX=
NVIDIA32_LIB_BASE=/usr/lib32/nvidia
NVIDIA32_LIB_PREFIX=
NVIDIA_XORG='/usr/lib/nvidia/xorg/modules/extensions/libglx.so.${NVIDIA_VERSION}'
#ATI
ATI_LIB_BASE=/usr/lib/fglrx
ATI_LIB_PREFIX="fglrx-"
ATI32_LIB_BASE=/usr/lib32/fglrx
ATI32_LIB_PREFIX="fglrx-"
ATI_XORG='/usr/lib/xorg/modules/extensions/fglrx/fglrx-libglx.so'

function FindRealFile {
	found=false
	result=
	for i in $2*; do
		if [ -f $i ] && [ ! -h $i ]; then
			if $found; then
				return 2
			else
				found=true
				result=$i
			fi
		fi
	done

	if $found; then
	    eval "$1='$result'"
		return 0
	else
		return 1
	fi
}

function GetVersion {
	pattern=".*$3\.(.*)\$"
	if [[ $2 =~ $pattern ]]; then
		eval "$1='${BASH_REMATCH[1]}'"
		return 0
	else
		return 1
	fi
}

# Track the state
NVIDIA=false
NVIDIA32=false
ATI=false
ATI32=false
MESA=false
MESA32=false
FALLBACK=MESA
FALLBACK32=MESA32

function FindDriver() {
	local DRIVER=$1
	local BASELIB=$2
	if FindRealFile `eval echo ${DRIVER}_LIBGL` `eval echo \"\$\{${DRIVER}_LIB_BASE\}/${BASELIB}\"` &&
		GetVersion `eval echo ${DRIVER}_VERSION \$\{${DRIVER}_LIBGL\} \"${BASELIB}\"` ; then
		echo -e "${3}Found \e[4m${DRIVER}\e[24m libGL `eval echo \$\{${DRIVER}_VERSION\}`"
		eval ${DRIVER}=true
		return 0
	else
		return 1
	fi
}

if FindDriver NVIDIA "libGL.so" ; then
	FindDriver NVIDIA32 "libGL.so" "  * "
fi
if FindDriver ATI "fglrx-libGL.so" ; then
	FindDriver ATI32 "fglrx-libGL.so" "  * "
fi
if FindDriver MESA "libGL.so" ; then
	FindDriver MESA32 "libGL.so" "  * "
fi

echo ""

CURRENT_LIBGL=`readlink -f ${LIB_BASE}/libGL.so`
CURRENT=""
if [[ "$CURRENT_LIBGL" = "$NVIDIA_LIBGL" ]]; then
	CURRENT="NVIDIA"
	echo -e "Current libGL is \e[1mNVIDIA\e[21m"
elif [[ "$CURRENT_LIBGL" = "$ATI_LIBGL" ]]; then
	CURRENT="ATI"
	echo -e "Current libGL is \e[1mATI\e[21m"
elif [[ "$CURRENT_LIBGL" = "$MESA_LIBGL" ]]; then
	CURRENT="MESA"
	echo -e "Current libGL is \e[1mMESA\e[21m"
fi

function GetLib() {
	local SEARCHPATH=`eval echo \$\{$2_LIB_BASE\}/\$\{$2_LIB_PREFIX\}$3`
	if FindRealFile FILE $SEARCHPATH ; then
		eval $1=$FILE
		return 0
	else
		return 1
	fi
}

function GetLibOrFallback() {
	local VAR=$1
	local DRIVER=$2
	local BASELIB=$3
	local REAL_FALLBACK

	if [[ $DRIVER =~ .*32 ]]; then
		REAL_FALLBACK=${FALLBACK32}
	else
		REAL_FALLBACK=${FALLBACK}
	fi

	if ! GetLib $VAR "$DRIVER" "$BASELIB" ; then
		# The expected library doesn't exist. Try the fallback.
		if $(eval \$\{$REAL_FALLBACK\}); then
			GetLib "$VAR" "$REAL_FALLBACK" "$BASELIB"
		else
			echo "Library for \"$DRIVER\" not found (but necessary for fallback!!!)"
			exit 1
		fi
	fi
}

function DoBaseSymlinks() {
	local DRIVER=$1
	local FUNC=$2
	local BASELIB=$3
	local LINK=$4

	if [[ $DRIVER =~ .*32 ]]; then
		cd $LIB32_BASE
	else
		cd $LIB_BASE
	fi

	eval Get$FUNC LIB $DRIVER "$BASELIB"
	
	local PREFIX=`eval echo \$\{$1_LIB_PREFIX\}`
	local LIB_NAME=`basename $LIB`
	local LIB_NAME=${LIB_NAME#$PREFIX}
	rm -f $BASELIB*
	ln -s $LIB $LIB_NAME
	ln -s $LIB_NAME $BASELIB 
	ln -s $LIB_NAME $LINK
}

function DoLibGL() {
	cd $LIB_BASE
	DoBaseSymlinks $1 Lib "libGL.so" "libGL.so.1"
}

function DoLibEGL() {
	cd $LIB_BASE
	DoBaseSymlinks $1 LibOrFallback "libEGL.so" "libEGL.so.1"
}

function DoLibGLESv1_CM() {
	cd $LIB_BASE
	DoBaseSymlinks $1 LibOrFallback "libGLESv1_CM.so" "libGLESv1_CM.so.1"
}

function DoLibGLESv2() {
	cd $LIB_BASE
	DoBaseSymlinks $1 LibOrFallback "libGLESv2.so" "libGLESv2.so.2"
}

function DoLibGLX {
	cd $LIBGLX_BASE
	LIB=$(eval echo $(eval echo \$\{$1_XORG\}))
	rm -f libglx.so
	ln -s $LIB libglx.so
}

function DoLibraries() {
	if [[ "$1" = "$CURRENT" ]]; then
		echo "Nothing to do. $1 is already in use."
	elif `eval \$\{$1\}`; then
		#Default libs
		DoLibGL $1
		DoLibEGL $1
		DoLibGLESv1_CM $1
		DoLibGLESv2 $1
		DoLibGLX $1
		#if available, do the 32bit variant too
		if `eval \$\{${1}32\}`; then
			DoLibGL ${1}32
			DoLibEGL ${1}32
			DoLibGLESv1_CM ${1}32
			DoLibGLESv2 ${1}32
			#GLX doesn't matter, the xserver will be "native" anyway
		fi
		echo "Done. Libraries set to $1."
	else
		echo "$1 was not found!"
	fi
}

function ConfigureXorg() {
	local DRIVER=$1

	if [[ -h $XORG_CONF ]]; then
		rm -f $XORG_CONF
	fi

	if [[ ! -e $XORG_CONF && -e ${XORG_CONF}.${DRIVER} ]]; then
		ln -s ${XORG_CONF}.${DRIVER} ${XORG_CONF}
	fi
}

if [[ $1 == "--init" ]]; then
	TARGET=`grep -oP '(?<=\bmultigl\=).*\b' /proc/cmdline`
else
	TARGET=$1
fi

if [[ $TARGET =~ (NVIDIA|ATI|MESA|none) ]]; then
	echo ""

	# Make sure only root can run our script
	if [[ $EUID -ne 0 ]]; then
	   echo "This script must be run as root to change libs!" 1>&2
	   exit 1
	fi

	case "$TARGET" in
		"NVIDIA")
			DoLibraries "NVIDIA"
			ConfigureXorg "NVIDIA"
			;;
		"ATI")
			DoLibraries "ATI"
			ConfigureXorg "ATI"
			;;
		"MESA")
			DoLibraries "MESA"
			ConfigureXorg "MESA"
			;;
		"none")
			for i in libGL.so libEGL.so libGLESv1_CM.so libGLESv2.so; do
				rm -f ${LIB_BASE}/${i}*
				rm -f ${LIB32_BASE}/${i}*
			done
			rm -f ${LIBGLX_BASE}/libglx.so
			;;
	esac
fi
