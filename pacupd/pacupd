#!/bin/bash
######################
# Pacman update script
# by Mladen Pejaković <pejakm@gmail.com>
########################################


PACMAN=/usr/bin/pacman
P_BUPD="-Sy --noprogressbar"
P_CUPD=-Qu
P_UPD="-Squ --noconfirm --noprogressbar"

startupgrade(){
  kdialog --passivepopup "System upgrade: updating database(s)..." 15 &&
  out1=`sudo $PACMAN $P_BUPD` &&
  kdialog --passivepopup "Local database(s) are updated!" 10 ||
  kdialog --title "Error" --error "\n\n$out1" &&
if [ "`$PACMAN $P_CUPD`" != "" ]; then
  kdialog --title "System upgrade" --yesno "Following packages for upgrade are available:\n\n`$PACMAN $P_CUPD`\n\nContinue with upgrade?" &&
 (kdialog --passivepopup "Starting system upgrade, please wait..." 15 && (sudo $PACMAN $P_UPD && kdialog --passivepopup "System upgrade successfully finished" 15) || kdialog --title "Error" --error "\n\nError during upgrade!") ||
 kdialog --passivepopup "System upgrade terminated" 10
else
  kdialog --passivepopup "There is no packages to upgrade..." 15
fi
}

if [ "$1" = "--start" ]; then
    startupgrade
   exit 1
else
 echo "PACman UPDate script"
 echo "Copyright (C) 2010, Mladen Pejaković"
 echo "Released under the terms of the GNU GPL"
 echo
 echo "Usage: pacupd --start"
fi
