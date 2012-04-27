#!/bin/sh

cd /usr/share/java/sqlsentinel

"$JAVA_HOME/bin/java" -jar /usr/share/java/sqlsentinel/sqlsentinel.jar "$@"

exit $?
