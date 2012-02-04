#!/bin/sh

cd /opt/jstock
"$JAVA_HOME/bin/java" -Xms64m -Xmx512m -jar 'jstock.jar'
