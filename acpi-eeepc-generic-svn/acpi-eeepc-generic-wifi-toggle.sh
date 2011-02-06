#!/bin/bash
#
#  EeePC WIFI Toggle
#  by Andrew Wyatt
#  Edited by Nicolas Bigaouette
#  Generic WIFI toggle utility which should work across EeePC models.
#

. /etc/conf.d/acpi-eeepc-generic.conf
. /etc/acpi/eeepc/acpi-eeepc-generic-functions.sh

EEEPC_RADIO_SAVED_STATE_FILE=$EEEPC_VAR/wifi-saved

if [ -e $EEEPC_RADIO_SAVED_STATE_FILE ]; then
  RADIO_SAVED_STATE=$(cat $EEEPC_RADIO_SAVED_STATE_FILE)
else
  RADIO_SAVED_STATE=0
fi

# Find the right rfkill switch, but default to the first one
rfkill="rfkill0"
lsrfkill=""
[ -e /sys/class/rfkill ] && lsrfkill=`/bin/ls /sys/class/rfkill/`
for r in $lsrfkill; do
    echo "r = $r"
    name=`cat /sys/class/rfkill/$r/name`
    [ "$name" == "eeepc-wlan" ] && rfkill=$r
done

# Get rfkill switch state (0 = card off, 1 = card on)
RADIO_CONTROL="/sys/class/rfkill/${rfkill}/state"
RADIO_STATE=0
[ -e "$RADIO_CONTROL" ] && RADIO_STATE=$(cat $RADIO_CONTROL)

[ ! -d "$EEEPC_VAR" ] && mkdir -p $EEEPC_VAR 2>/dev/null

# Get wifi interface
WIFI_IF=$(/usr/sbin/iwconfig 2>/dev/null | grep ESSID | awk '{print $1}')

logger "acpi-eeepc-generic-wifi-toggle.sh: Current state: $RADIO_STATE ($RADIO_CONTROL)"

function radio_on {
    eeepc_notify "Turning WiFi Radio on..." gnome-dev-wavelan

    # Execute pre-up commands just once
    [ $1 -eq 1 ] && execute_commands "${COMMANDS_WIFI_PRE_UP[@]}"

    # Enable radio
    [ -e "$RADIO_CONTROL" ] && echo 1 > $RADIO_CONTROL

    # Load module
    ( /sbin/modprobe $WIFI_DRIVER 2>/dev/null && (
        # If successful, enable card
        echo 1 > $EEEPC_RADIO_SAVED_STATE_FILE
        # Execute post-up commands
        execute_commands "${COMMANDS_WIFI_POST_UP[@]}"

        eeepc_notify "WiFi Radio is now on" gnome-dev-wavelan
    ) || (
        eeepc_notify "Could not enable WiFi radio" stop
        # If module loading unsuccessful, try again
        if [ $1 -lt $WIFI_TOGGLE_MAX_TRY ]; then
            eeepc_notify "Trying again in 2 second ($(($1+1)) / $WIFI_TOGGLE_MAX_TRY)" gnome-dev-wavelan
            sleep 2
            radio_on $(($1+1))
        fi
    ) )
}

function radio_off {
    eeepc_notify "Turning WiFi Radio off..." gnome-dev-wavelan

    # Execute pre-down commands just once
    [ $1 -eq 1 ] && execute_commands "${COMMANDS_WIFI_PRE_DOWN[@]}"

    # Put interface down and wait 1 second
    /sbin/ifconfig $WIFI_IF down 2>/dev/null
    sleep 1

    # Unload module
    ( /sbin/modprobe -r $WIFI_DRIVER 2>/dev/null && (
        # If successful, disable card through rkfill and save the state
        [ -e "$RADIO_CONTROL" ] && echo 0 > $RADIO_CONTROL
        echo 0 > $EEEPC_RADIO_SAVED_STATE_FILE

        # Execute post-down commands
        execute_commands "${COMMANDS_WIFI_POST_DOWN[@]}"

        eeepc_notify "WiFi Radio is now off" gnome-dev-wavelan
    ) || (
        # If module unloading unsuccessful, try again
        eeepc_notify "Could not disable WiFi radio" stop
        if [ $1 -lt $WIFI_TOGGLE_MAX_TRY ]; then
            eeepc_notify "Trying again in 2 second ($(($1+1)) / $WIFI_TOGGLE_MAX_TRY)" gnome-dev-wavelan
            sleep 2
            radio_off $(($1+1))
        fi
    ) )
}

function radio_toggle {
    if [ "$RADIO_STATE" = "1" ]; then
        radio_off 1
    else
        radio_on 1
    fi
}

function radio_restore {
  if [ "$RADIO_SAVED_STATE" = "1" ]; then
    radio_on 1
  else
    radio_off 1
  fi
}

case $1 in
    "restore")
        radio_restore
    ;;
    "off")
        radio_off 1
    ;;
    "on")
        radio_on 1
    ;;
  *)
    radio_toggle
  ;;
esac

