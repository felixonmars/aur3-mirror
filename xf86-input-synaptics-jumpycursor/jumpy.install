#!/bin/bash

pkgname=gnome-utils

post_install() {
  echo
  echo
  echo Add:
  echo for Dell Mini 10 / Inspiron 1011 and 1012
  echo "     Option \"JumpyCursorThreshold\" \"90\""
  echo "     Option \"AreaBottomEdge\" \"4100\""
  echo
  echo or for HP MiniNote 1000
  echo "     Option \"JumpyCursorThreshold\" \"200\""
  echo
  echo to Synaptics-InputDevice-Section in /etc/X11/xorg.conf
  echo
  echo


}

post_upgrade() {
  post_install $1
}

