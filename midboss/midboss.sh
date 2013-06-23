#!/bin/sh
if [ ! -e ~/.config/midboss/MidBoss.py ] ; then
	mkdir ~/.config/midboss
	for a in /usr/share/midboss/* ; do ln -s $a ~/.config/midboss ; done
fi
cd ~/.config/midboss
python2 MidBoss.py
