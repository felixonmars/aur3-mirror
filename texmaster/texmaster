#!/bin/sh
# Small Texmaster 2009 startup script by p2k #

if ! [ -d "$HOME/.texmaster" ];then
	mkdir -p "$HOME/.texmaster"
	cd "$HOME/.texmaster"
	ln -s /opt/texmaster/Texmaster2009
	ln -s /opt/texmaster/data
	cp /opt/texmaster/Texmaster2009.ini .
fi

cd "$HOME/.texmaster"
./Texmaster2009 $*
