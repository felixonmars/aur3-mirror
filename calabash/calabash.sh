#!/bin/sh
CLASSPATH=/usr/share/java/commons-httpclient/commons-httpclient-3.1.jar:/usr/share/java/tagsoup-1.2.jar
for lib in saxon calabash commons-io commons-logging commons-codec
do
  CLASSPATH=$CLASSPATH:/usr/share/java/$lib/$lib.jar
done
exec "$JAVA_HOME/bin/java" -cp $CLASSPATH com.xmlcalabash.drivers.Main "$@"
