#!/usr/bin/env bash
cd ~/
mkdir -p ~/.config/steam-ice
cd ~/.config/steam-ice
if [ ! -f ~/.config/steam-ice/config.txt ] ; then
	echo "copying example config.txt to ~/.config/steam-ice/"
	cp /usr/share/steam-ice/config.txt.example ~/.config/steam-ice/config.txt
fi
if [ ! -f ~/.config/steam-ice/emulators.txt ] ; then
	echo "copying example emulators.txt to ~/.config/steam-ice/"
	cp /usr/share/steam-ice/emulators.txt.example ~/.config/steam-ice/emulators.txt
fi
if [ ! -f ~/.config/steam-ice/consoles.txt ] ; then
	echo "copying example consoles.txt to ~/.config/steam-ice/"
	cp /usr/share/steam-ice/consoles.txt.example ~/.config/steam-ice/consoles.txt
fi
python2 /usr/share/steam-ice/ice.py
