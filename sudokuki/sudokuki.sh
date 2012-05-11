#!/bin/sh

cd /usr/share/sudokuki
"$JAVA_HOME/bin/java" -Djava.library.path=/usr/lib -jar sudokuki-1.1.4.jar -ui Swing "$@"
