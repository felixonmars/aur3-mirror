#!/bin/sh
CLASSPATH=/usr/share/java/saxon/saxon9he.jar:/usr/share/java/calabash/calabash.jar:/usr/share/java/commons-httpclient/commons-httpclient-3.1.jar:/usr/share/java/commons-logging/commons-logging.jar:/usr/share/java/commons-codec/commons-codec-1.4.jar:/usr/share/java/tagsoup-1.2.jar
exec $JAVA_HOME/bin/java -cp $CLASSPATH com.xmlcalabash.drivers.Main "$@"
