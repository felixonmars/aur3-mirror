#!/bin/bash

# fix for users of special IM modules
unset XMODIFIERS GTK_IM_MODULE QT_IM_MODULE
unset CLASSPATH

PKGNAME=starsector

BASEPATH=~/.${PKGNAME}
SAVEPATH=${BASEPATH}/saves
MODPATH=${BASEPATH}/mods
SCRPATH=${BASEPATH}/screenshots
LOGPATH=${BASEPATH}/

[ -d ~/.starfarer ] && mv ~/.starfarer ~/.${PKGNAME}
	
[ -d ${BASEPATH} ] || mkdir ${BASEPATH}
[ -d ${SAVEPATH} ] || mkdir ${SAVEPATH}
[ -d ${MODPATH}  ] || mkdir ${MODPATH}
[ -d ${SCRPATH}  ] || mkdir ${SCRPATH}

for jarfile in /usr/share/java/${PKGNAME}/*.jar ; do
  CLASSPATH=${CLASSPATH}:${jarfile}
done

cd /usr/share/${PKGNAME}
exec java -server -XX:CompilerThreadPriority=1 \
  -XX:+CompilerThreadHintNoPreempt \
  -Djava.library.path=/usr/lib/${PKGNAME} \
  -Xms512m -Xmx512m -classpath ${CLASSPATH} \
  -Dcom.fs.starfarer.settings.paths.saves=${SAVEPATH} \
  -Dcom.fs.starfarer.settings.paths.screenshots=${SCRPATH} \
  -Dcom.fs.starfarer.settings.paths.mods=${MODPATH} \
  -Dcom.fs.starfarer.settings.paths.logs=${LOGPATH} \
  com.fs.starfarer.StarfarerLauncher
# vim:set ts=2 sw=2 et:
