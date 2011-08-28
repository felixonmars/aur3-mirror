#!/bin/bash

DIR="/usr/share/java"
CLASSPATH=$DIR/jgoodies-looks/looks-*.jar:$DIR/jgoodies-forms/forms-*.jar:$DIR/jdom/jdom.jar:$DIR/hsqldb.jar:$DIR/jaolt/launcher.jar

java -classpath $CLASSPATH -Xmx512M $* de.shandschuh.jaolt.launcher.ApplicationLauncher

