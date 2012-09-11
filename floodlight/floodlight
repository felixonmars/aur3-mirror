#!/bin/sh

JVM_OPTS=""
JVM_OPTS="$JVM_OPTS -server -d64"
JVM_OPTS="$JVM_OPTS -Xmx2g -Xms2g -Xmn800m"
JVM_OPTS="$JVM_OPTS -XX:+UseParallelGC -XX:+AggressiveOpts -XX:+UseFastAccessorMethods"
JVM_OPTS="$JVM_OPTS -XX:MaxInlineSize=8192 -XX:FreqInlineSize=8192"
JVM_OPTS="$JVM_OPTS -XX:CompileThreshold=1500 -XX:PreBlockSpin=8"
JVM_OPTS="$JVM_OPTS -Dpython.security.respectJavaAccessibility=false"

JAR="/usr/share/java/floodlight/floodlight.jar"
CFG="/etc/floodlight/floodlightdefault.properties"
LOG="/etc/floodlight/logback.xml"

"$JAVA_HOME/bin/java" -Dlogback.configurationFile="$LOG" -jar "$JAR" -cf "$CFG" "$@"
