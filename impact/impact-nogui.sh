#!/bin/sh

export CLASSPATH=.:bin:doc

cd /opt/impact
"$JAVA_HOME/bin/java" -Xmx1000m -Xss1m run.Impact $*
