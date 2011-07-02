#!/bin/bash
if [ ! -d ~/.starfarer ]
  then mkdir ~/.starfarer
fi

if [ ! -d ~/.starfarer/saves ]
  then mkdir ~/.starfarer/saves
fi

if [ ! -d ~/.starfarer/screenshots ]
  then mkdir ~/.starfarer/screenshots
fi

if [ ! -d ~/.starfarer/mods ]
  then mkdir ~/.starfarer/mods
fi

for name in /usr/share/java/starfarer/*.jar ; do
  CP=$CP:$name
done

cd /usr/share/starfarer

SAVEPATH=~/.starfarer/saves
MODPATH=~/.starfarer/mods
SCRPATH=~/.starfarer/screenshots

exec java -Djava.library.path=/usr/lib/starfarer -Xms256m -Xmx256m -cp $CP -Dcom.fs.starfarer.settings.paths.saves=$SAVEPATH -Dcom.fs.starfarer.settings.paths.screenshots=$SCRPATH -Dcom.fs.starfarer.settings.paths.mods=$MODPATH com.fs.starfarer.StarfarerLauncher
