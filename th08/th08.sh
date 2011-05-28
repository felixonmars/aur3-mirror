#!/bin/bash
export WINEPREFIX="$HOME/.th08/wine"
export WINEDLLOVERRIDES="mshtml="

if [ ! -d "$HOME"/.th08 ] ; then
  mkdir -p "$HOME"/.th08/wine || exit 1
  cp -r /usr/share/th08/th08.cfg "$HOME"/.th08 || exit 1
  ln -s /usr/share/th08/th08.exe "$HOME"/.th08/th08.exe || exit 1
  ln -s /usr/share/th08/custom.exe "$HOME"/.th08/custom.exe || exit 1
  ln -s /usr/share/th08/th08tr.dat "$HOME"/.th08/th08tr.dat || exit 1
fi
if [ "" != "`whereis timidity|grep '/usr/bin'`" ] ; then
	if [ "" == "`ps -A|grep timidity`" ] ; then
		timidity -iA &
		myins="true"
	fi
fi
#mv ~/.th08/th08.cfg ~/.th08/th08.cfg.old
#base64 <~/.th08/th08.cfg.old |sed 's/.\(....\)$/I\1/'|base64 -d>~/.th08/th08.cfg
#rm ~/.th08/th08.cfg.old
cd ~/.th08
if [ -e "$HOME"/.th08/th08e.exe ]; then
	wine "$HOME"/.th08/th08e.exe "$@"
fi
if [ ! -e "$HOME"/.th08/th08e.exe ]; then
	wine "$HOME"/.th08/th08.exe "$@"
fi
if [ "true" == "$myins" ] ; then
	killall timidity
fi

