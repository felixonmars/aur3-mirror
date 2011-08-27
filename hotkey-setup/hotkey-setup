#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

manufacturer=`dmidecode --string system-manufacturer`
name=`dmidecode --string system-product-name`
version=`dmidecode --string system-version`

SAVED_STATE=/var/run/hotkey-setup
THINKPAD_LOCKFILE=$SAVED_STATE.thinkpad-keys
THINKPAD_PROC_HOTKEY=/proc/acpi/ibm/hotkey
THINKPAD_KEYS=/usr/sbin/thinkpad-keys

xorg_driver() {
    if [ -e /etc/X11/xorg.conf ] ; then
	sed -n -e '/^[ \t]*section[ \\t]*"device"/I,/^[ \t]*endsection/I{/^[ \t]*driver[ \t]*/I{s/^[ \t]*driver[ \t]*"*//I;s/"*[ \t]*$//;p}}' /etc/X11/xorg.conf
    fi
}

do_video () {
    VIDEO=`xorg_driver`
    case $VIDEO in
	intel|ati|radeon)
	    for x in /proc/acpi/video/*/DOS; do
		if [ -e "$x" ]; then
		    echo -n 4 >$x;
		fi
	    done
	;;
    esac
}

# This is here because it needs to be executed both if we have a
# Lenovo that also IDs as a ThinkPad, or if we have a real IBM one.

do_thinkpad () {
    . /usr/share/hotkey-setup/ibm.hk
    modprobe thinkpad-acpi

    VIDEO=`xorg_driver`
    case $VIDEO in
	intel|ati|radeon)
	    echo 0xffffff > $THINKPAD_PROC_HOTKEY
	;;
    esac

    # Try to enable the top 8-bits of the mask
    sed -e '/mask:/s/.*\(....\)$/0xff\1/p;d' $THINKPAD_PROC_HOTKEY > $THINKPAD_PROC_HOTKEY
    # If the top bit (ThinkPad key) sticks, skip the polling-daemon
    if ! grep -q '0x[8-9a-f].....$' $THINKPAD_PROC_HOTKEY && test -x $THINKPAD_KEYS; then
        if [ ! -c /dev/input/uinput ]; then
            modprobe uinput
        fi
        if [ ! -c /dev/nvram ]; then
            modprobe nvram
        fi
        $THINKPAD_KEYS $1 && touch $THINKPAD_LOCKFILE
    fi
}

case "$1" in
    start)

    stat_busy "Starting hotkey-setup"

# This entire block does nothing on desktops right now

    if laptop-detect; then

    do_video

    /usr/sbin/dumpkeycodes >$SAVED_STATE
    
    if [ $? -gt 0 ]; then
    rm -f $SAVED_STATE
    fi

    . /usr/share/hotkey-setup/key-constants

    case "$manufacturer" in
    Acer*)
    . /usr/share/hotkey-setup/acer.hk
    case "$name" in
        Aspire\ 16*)
        . /usr/share/hotkey-setup/acer-aspire-1600.hk
        ;;
    esac
    ;;

    ASUS*)
    . /usr/share/hotkey-setup/asus.hk
    ;;

    Compaq*)
    case "$name" in
        Armada*E500*|Evo*N620*)
        . /usr/share/hotkey-setup/compaq.hk
        ;;
    esac
    ;;

    Dell*)
    . /usr/share/hotkey-setup/dell.hk
    ;;

    Hewlett-Packard*)
    # Load this _first_, so that it can be overridden
    . /usr/share/hotkey-setup/hp.hk
    case "$name" in
        # Please open a bug if uncommenting these "Presario" entries works for you...
        #*Presario\ V2000*)
        #. /usr/share/hotkey-setup/hp-v2000.hk
        #;;
        *Tablet*|*tc*)
        . /usr/share/hotkey-setup/hp-tablet.hk
        ;;
    esac
    ;;

    IBM*)
    do_thinkpad IBM
    ;;

    LENOVO*)
    case "$version" in
        *Think[Pp]ad*)
        do_thinkpad --no-brightness
        ;;
        *)
        . /usr/share/hotkey-setup/lenovo.hk
        ;;
    esac
    ;;
    
    MEDION*)
    case "$name" in
        *FID2060*)
        . /usr/share/hotkey-setup/medion-md6200.hk
        ;;
    esac
    ;;

    MICRO-STAR*)
    case "$name" in
        *INFINITY*)
        . /usr/share/hotkey-setup/micro-star-infinity.hk
        ;;
    esac
    ;;

    Samsung*|SAMSUNG*)
    . /usr/share/hotkey-setup/samsung.hk
    ;;

    Sony*)
    modprobe sonypi; # Needed to get hotkey events
    modprobe sony-laptop
    ;;

    *)
    . /usr/share/hotkey-setup/default.hk	
    esac
    . /usr/share/hotkey-setup/generic.hk
    fi
    add_daemon hotkey-setup
    stat_done
    ;;

    stop)
    
    stat_busy "Stopping hotkey-setup"
    
	if [ -f $THINKPAD_LOCKFILE ]; then
	    kill `pidof thinkpad-keys` || true ; rm -f $THINKPAD_LOCKFILE
	fi
	if [ -f $SAVED_STATE ]; then
		setkeycodes $(cat $SAVED_STATE) || true
	fi
	rm_daemon hotkey-setup
	stat_done

    ;;

    
    restart)
    $0 stop 
    sleep 1
    $0 start
    ;;
    
    *)
    echo "usage: $0 {start|stop|restart}"
esac