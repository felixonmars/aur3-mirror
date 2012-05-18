#!/bin/sh

cd /usr/share/sudokuki
"$JAVA_HOME/bin/java" -Djava.library.path=/usr/lib -jar sudokuki.jar -ui Swing "$@"
