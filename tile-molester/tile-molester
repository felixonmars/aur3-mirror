#!/bin/sh
if [ ! -e $HOME/settings.dtd ]; then
  cp /usr/share/tile-molester/settings.dtd $HOME/
fi
if [ ! -e $HOME/tmspec.dtd ]; then
  cp /usr/share/tile-molester/tmspec.dtd $HOME/
fi
if [ ! -e $HOME/tmspec.xml ]; then
  cp /usr/share/tile-molester/tmspec.xml $HOME/
fi
exec java -jar /usr/lib/tile-molester/tm.jar $@ 
