#!/bin/bash
if [ -z "$JAVACMD" ] ; then
		if [ -n "$JAVA_HOME"  ] ; then
				if [ -x "$JAVA_HOME/jre/sh/java" ] ; then
						# IBM's JDK on AIX uses strange locations for the executables
						JAVACMD="$JAVA_HOME/jre/sh/java"
				else
						JAVACMD="$JAVA_HOME/bin/java"
				fi
		else
				JAVACMD="`which java`"
		fi
fi
if [ -z "$JAVA_ARGS" ]
then
		JAVA_ARGS=""
fi
$JAVACMD $JAVA_ARGS -jar /usr/share/xsbt/sbt-launch-${pkgver}.jar "$@"
