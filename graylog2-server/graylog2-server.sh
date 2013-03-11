#!/bin/sh
JAVA_HOME=${JAVA_HOME:-/usr/lib/jvm/java-7-openjdk}
exec $JAVA_HOME/bin/java -jar /usr/lib/graylog2-server.jar "$@" 
