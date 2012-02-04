#!/bin/sh
export NAME='th06-demo'
export SRC="/usr/share/$NAME"
export DEST="$HOME/.$NAME"
export WINEPREFIX="$DEST/wine"
export WINEDLLOVERRIDES="mshtml="

# At the first launch, link the read-only data.
if [ ! -d "$DEST" ] ; then
	mkdir -p "$DEST"
	mkdir -p "$WINEPREFIX"
	ln -s "$SRC/東方紅魔郷.exe" "$DEST/th06.exe"
	ln -s "$SRC/custom.exe" "$DEST/custom.exe"
	for i in CM IN MD ST TL ; do
		ln -s "$SRC/紅魔郷$i.DAT" "$DEST/$i.DAT"
	done
fi

# Launch the MIDI server if installed and not running.
if [ '' != "`whereis timidity | grep '/usr/bin'`" ] ; then
	if [ "`ps -A | grep timidity`" == '' ] ; then
		timidity -iA &
		myins="true"
	fi
fi

cd "$DEST"

# Launch the game
wine th06.exe

# End the MIDI server.
if [ "$myins" == 'true' ] ; then
	killall timidity
fi

