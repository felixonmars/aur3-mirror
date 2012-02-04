#!/bin/sh
APPBASE="/usr/share/java/bluej-wsi"
JAVAPATH="/usr/lib/jvm/java-1.6.0-openjdk"
CP="$APPBASE/bluej.jar:$JAVAPATH/tools.jar:$APPBASE/junit.jar:$APPBASE/tuebingen-test.jar:$APPBASE/tester.jar"
"$JAVAPATH/bin/java" -cp "$CP" -Dfile.encoding=UTF-8 bluej.Boot  "$@"
