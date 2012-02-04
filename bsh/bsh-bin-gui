#!/bin/sh
#
# Beanshell
# http://www.beanshell.org
#

if [ "$CLASSPATH" = "" ]; then
	CLASSPATH="/usr/share/java/bsh.jar"
else
	CLASSPATH="/usr/share/java/bsh.jar":$CLASSPATH
fi

exec "$JAVA_HOME/bin/java" -classpath $CLASSPATH $JAVA_OPTS bsh.Console "$@"
