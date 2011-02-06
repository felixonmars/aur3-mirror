#!/bin/sh

MOONLIGHT_BASE=/usr/share/java/moonlight3d
FILES_BASE=/usr/share/moonlight3d

MOONLIGHT_LIB=$MOONLIGHT_BASE/lib/Linux/`uname -m`
export LD_LIBRARY_PATH=$MOONLIGHT_LIB:$LD_LIBRARY_PATH

for i in $MOONLIGHT_BASE/lib/jar/*.jar ; do
  CLASSPATH=$i:$CLASSPATH
done

for i in $MOONLIGHT_LIB/*.jar ; do
  CLASSPATH=$i:$CLASSPATH
done

for i in /usr/share/java/sunflow/*.jar ; do
  CLASSPATH=$i:$CLASSPATH
done

CLASSPATH=$CLASSPATH:$MOONLIGHT_BASE/ml3d.jar

java -server -Dcom.trolltech.qt.library-path=$MOONLIGHT_LIB -Xmx1024m -cp $CLASSPATH eu.moonlight3d.ml3d.MLBatch $FILES_BASE $*
