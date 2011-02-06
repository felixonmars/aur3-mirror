#!/bin/sh
[[ "$JAVA_HOME" && -x "$JAVA_HOME"/bin/java ]] || . /etc/profile
exec "$JAVA_HOME"/bin/java -Xmx512m -cp /usr/share/java/imagej/ij.jar:/opt/java/lib/tools.jar ij.ImageJ -ijpath /usr/share/imagej "$@"
