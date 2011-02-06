#!/bin/sh

MOONLIGHT_BASE=/usr/share/java/mlhdrviewer
FILES_BASE=/usr/share/mlhdrviewer

for i in $MOONLIGHT_BASE/lib/jar/*.jar ; do
  CLASSPATH=$i:$CLASSPATH
done

CLASSPATH=/usr/share/java/qtjambi.jar:$CLASSPATH:$MOONLIGHT_BASE/mlhdrviewer.jar

java -server -Dcom.trolltech.qt.library-path=/usr/lib/ -Xmx1024m -cp $CLASSPATH eu.moonlight3d.hdrviewer.HDRViewer $MOONLIGHT_BASE $*
