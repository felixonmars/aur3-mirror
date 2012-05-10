#!/bin/sh

[ `uname -m` == "i686" ] && ARCH="i386"
[ `uname -m` == "x86_64" ] && ARCH="amd64"

export LD_LIBRARY_PATH="$JAVA_HOME/jre/lib/$ARCH":/usr/lib
export CLASSPATH=.:bin:doc:lib/*:/usr/share/java/jogl/*:"$JAVA_HOME"/jre/lib/ext/*

cd /opt/impact
"$JAVA_HOME/bin/java" -Xmx1000m -Xss1m -Djava.library.path="$LD_LIBRARY_PATH" gui.ImpactGUI -opengl
