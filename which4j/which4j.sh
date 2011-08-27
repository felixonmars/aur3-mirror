#!/bin/bash

if [ "$CLASSPATH" = "" ]; then
        CLASSPATH="/usr/share/java/which4j/which4j.jar"
else
        CLASSPATH=$CLASSPATH:"/usr/share/java/which4j/which4j.jar"
fi

java org.theshoemakers.which4j.Which4J $*
