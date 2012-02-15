#!/bin/sh
"$JAVA_HOME/bin/java" -cp "/usr/share/java/aspectj/aspectjweaver.jar" "-Djava.system.class.loader=org.aspectj.weaver.loadtime.WeavingURLClassLoader" "-Daj.class.path=$ASPECTPATH:$CLASSPATH" "-Daj.aspect.path=$ASPECTPATH" "$@"
