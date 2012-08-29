#!/bin/bash
if [ "`uname -m`" == "x86_64" ]; then
  /opt/clonk_rage/clonk64 $*
else
  /opt/clonk_rage/clonk $*
fi

if [ $? == 126 ]; then
  message="You must be in the group 'games' to play Clonk Rage."
  zenity --info --text "${message}" ||
  kdialog --msgbox "${message}" ||
  xmessage -buttons okay -default okay "${message}"
fi
