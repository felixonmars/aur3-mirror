#!/bin/bash
#
# LVDS Rotate
# Andrew Wyatt
# Tool to rotate LVDS panel
#

source /etc/conf.d/acpi-eeepc-generic.conf
source /etc/acpi/eeepc/acpi-eeepc-generic-functions.sh 

[ ! -d "$EEEPC_VAR" ] && mkdir $EEEPC_VAR

function rotate_toggle {
  CURRENT=`xrandr  | grep LVDS | awk '{print $4}'`
  if [ "$CURRENT" = "left" ]; then
    ROTATION="inverted"
  elif [ "$CURRENT" = "inverted" ]; then
    ROTATION="right"
  elif [ "$CURRENT" = "right" ]; then
    ROTATION="normal"
  else
    ROTATION="left"
  fi
  if [ "$ROTATION" ]; then
    rotate_lvds "$ROTATION"
    echo "$ROTATION" > $EEEPC_VAR/rotation_saved
  fi
}

function restore_rotation {
  if [ -e "$EEEPC_VAR/rotation_saved" ]; then
    ROTATION=$(cat $EEEPC_VAR/rotation_saved)
    rotate_lvds "$ROTATION"
  fi
}

function rotate_lvds {
    eeepc_notify "Rotate LCD \"$1\"" screen
    xrandr --output LVDS --rotate "$1"
}

case $1 in
  inverted)
    rotate_lvds inverted
  ;;
  left)
    rotate_lvds left
  ;;
  right)
    rotate_lvds right
  ;;
  normal)
    rotate_lvds normal
  ;;
  restore)
    restore_rotation
  ;;
  *)
    rotate_toggle
  ;;
esac

