#!/bin/bash

# fix for users of special IM modules
unset XMODIFIERS GTK_IM_MODULE QT_IM_MODULE

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
LOGPATH=~/.starfarer/

LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$JAVA_HOME/lib/amd64/:$JAVA_HOME/lib/i386/:$JAVA_HOME/jre/lib/amd64/:$JAVA_HOME/jre/lib/i386/" exec java -Djava.library.path=/usr/lib/starfarer -Xms512m -Xmx512m -cp $CP -Dcom.fs.starfarer.settings.paths.saves=$SAVEPATH -Dcom.fs.starfarer.settings.paths.screenshots=$SCRPATH -Dcom.fs.starfarer.settings.paths.mods=$MODPATH -Dcom.fs.starfarer.settings.paths.logs=$LOGPATH com.fs.starfarer.StarfarerLauncher
