#!/bin/sh

##
# This script will set logback classpath variables.
##

LOGBACK_CORE=/usr/share/java/slf4j/slf4j-api.jar:/usr/share/java/logback/logback-core.jar
if [ -n "$GROOVY_HOME" ]; then
	LOGBACK_CORE=$LOGBACK_CORE:$GROOVY_HOME/lib/groovy-1.7.2.jar
fi
	

LOGBACK_CLASSIC=$LOGBACK_CORE:/usr/share/java/logback/logback-classic.jar
LOGBACK_ACCESS=$LOGBACK_CORE:/usr/share/java/logback/logback-access.jar
