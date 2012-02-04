#!/bin/bash
[ ! -d ~/.starfarer ] && mkdir ~/.starfarer
[ ! -d ~/.starfarer/saves ] && mkdir ~/.starfarer/saves
[ ! -d ~/.starfarer/screenshots ] && mkdir ~/.starfarer/screenshots
[ ! -d ~/.starfarer/mods ] && mkdir ~/.starfarer/mods

for name in /usr/share/java/starfarer/*.jar ; do
  CP=$CP:$name
done

cd /usr/share/starfarer

SAVEPATH=~/.starfarer/saves
MODPATH=~/.starfarer/mods
SCRPATH=~/.starfarer/screenshots
LOGPATH=~/.starfarer

export LD_LIBRARY_PATH="$JAVA_HOME/lib/$$ARCHITECTURE$$"

exec java -Djava.library.path=/usr/lib/starfarer -Xms256m -Xmx256m -cp $CP -Dcom.fs.starfarer.settings.paths.saves=$SAVEPATH -Dcom.fs.starfarer.settings.paths.screenshots=$SCRPATH -Dcom.fs.starfarer.settings.paths.mods=$MODPATH -Dcom.fs.starfarer.settings.paths.logs=$LOGPATH com.fs.starfarer.StarfarerLauncher

unset LD_LIBRARY_PATH
