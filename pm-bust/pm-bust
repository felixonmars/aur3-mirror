#!/bin/sh

TOUCHFILE=/var/run/pm-bust
QUESTION="Kernel update detected. Should I shutdown instead?"

export DISPLAY=:0

question() {
  if [ -f /usr/bin/zenity ]; then
    zenity --question --text "$QUESTION"
    return "$?"
  elif [ -f /usr/bin/Xdialog ]; then
    Xdialog --yesno "$QUESTION" 200x90
    return "$?"
  else
    echo "Install zenity or xdialog for GUI"
  fi
}

if [ -f $TOUCHFILE ]; then
  if [ $(find /var/cache/pacman/ -name 'kernel26*' -newer $TOUCHFILE | wc -l) -gt 0 ]; then
    if [ "$1" == "-gui" ]; then

      question

      if [ "$?" -eq 0 ]; then
        shutdown="y"
      else
        shutdown="n"
      fi
    else
      echo "Kernel update detected. Should I shutdown instead? [y/N]"
      read shutdown
    fi

    if [ "$shutdown" == "y" ]; then
      halt
    fi

    exit 0
  fi
fi

touch $TOUCHFILE

pm-hibernate
