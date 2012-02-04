#!/bin/sh
# Created for Arch package, based on original launcher

SHARE="/opt/games/ivory-mahjongg"		# Hardcoded, we are in package
JAVA="java"								# Both openjdk6 and sun-jre ensures
										# that PATH is set correctly

# Prepare CLASSPATH
CLASSPATH="/usr/share/java/*"
LIBRARY_PATH="."
# java3d package is little broken right now...
if [ -e /opt/opt/java/jre/lib/ext/j3dcore.jar ] ; then
	CLASSPATH=${CLASSPATH}:"/opt/opt/java/jre/lib/ext/*"
	[ -e /opt/opt/java/jre/lib/amd64/libj3dcore-ogl.so ] && LIBRARY_PATH="/opt/opt/java/jre/lib/amd64/":${LIBRARY_PATH}
	[ -e /opt/opt/java/jre/lib/i586/libj3dcore-ogl.so ] && LIBRARY_PATH="/opt/opt/java/jre/lib/i568/":${LIBRARY_PATH}
else
	CLASSPATH=${CLASSPATH}:"/opt/java/jre/lib/ext/*"
fi

# If pulseaudio is running, this game needs padsp to launch correctly
if [ $(ps x|grep pulseaudio|grep -v grep|wc -l ) -gt 0 ] ; then
	JAVA="padsp $JAVA"
fi

cd ${SHARE}
for i in $( find . -name \*.jar ); do
   CLASSPATH=${CLASSPATH}:${i}
done

# Launch the application.
${JAVA} -Djava.library.path=${LIBRARY_PATH} -classpath ${CLASSPATH} com.ivorymahjongg.mahjongg.Main
