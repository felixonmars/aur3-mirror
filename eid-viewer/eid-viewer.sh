#!/bin/sh
for name in /usr/share/java/eid-viewer/*.jar ; do
  CP=$CP:$name
done
"$JAVA_HOME/bin/java" -cp $CP be.fedict.eidviewer.gui.BelgianEidViewer
