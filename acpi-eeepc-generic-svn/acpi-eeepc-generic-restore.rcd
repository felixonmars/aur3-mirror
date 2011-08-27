#!/bin/sh
# EeePC Configuration restore
#
### BEGIN INIT INFO
# Provides:          eeepc-restore
# Default-Start:     2 3 4
# Default-Stop:      1 5
# Required-Start:
# Required-Stop:
# Short-Description: Restores EeePC settings from last boot.
### END INIT INFO

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/acpi/eeepc/acpi-eeepc-generic-functions.sh
. /etc/conf.d/acpi-eeepc-generic.conf

set -e

get_model

case "$1" in
restart|reload|force-reload|start)
  stat_busy "Restore eeepc-acpi configuration"

  if [ "$BOOT_BLUETOOTH" = "1" ]; then
    if [ -e "$EEEPC_VAR/bt_saved" ]; then
      $EEEPC_PATH/eeepc-bluetooth-toggle.sh restore 2>/dev/null &
    fi
  fi

  if [ "$BOOT_CAMERA" = "1" ]; then
    if [ -e "$EEEPC_VAR/cam_saved" ]; then
      $EEEPC_PATH/eeepc-camera-toggle.sh restore 2>/dev/null &
    fi
  fi

  if [ "$BOOT_CPUFREQ" = "1" ]; then
    if [ -e "$EEEPC_VAR/cpu_mode" ]; then
      (sleep $BOOT_CPU_DELAY; $EEEPC_PATH/eeepc-cpu-control.sh restore 2>/dev/null) &
    fi
  fi

  if [ "$BOOT_WIFI" = "1" ]; then
    if [ -e "$EEEPC_VAR/eeepc-wifi-saved" ]; then
      $EEEPC_PATH/eeepc-wifi-toggle.sh restore 2>/dev/null &
    fi
  fi
  stat_done
  ;;

client)

  stat_busy "Restore eeepc-acpi configuration"

  if [ "$BOOT_TOUCHPAD" = "1" ]; then
    if [ -e "$EEEPC_VAR/touchpad_saved" ]; then
      $EEEPC_PATH/eeepc-touchpad-toggle.sh restore 2>/dev/null &
    fi
  fi

  if [ "$BOOT_VGA" = "1" ]; then
    if [ -e "$EEEPC_VAR/vga_saved" ]; then
      $EEEPC_PATH/eeepc-vga-toggle.sh restore 2>/dev/null &
    fi
  fi

  if [ "$BOOT_ROTATION" = "1" ]; then
    if [ -e "$EEEPC_VAR/rotation_saved" ]; then
      $EEEPC_PATH/eeepc-rotate-lvds.sh restore 2>/dev/null &
    fi
  fi

  if [ "$BOOT_RESOLUTION" = "1" ]; then
    if [ -e "$EEEPC_VAR/resolution_saved" ] ; then
      $EEEPC_PATH/eeepc-lvds-resolution-toggle.sh restore 2>/dev/null &
    fi
  fi
  stat_done
  ;;
stop)
  ;;
esac

exit 0
