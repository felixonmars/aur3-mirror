#!/bin/sh
OS_ARCH=`uname -aa | grep x86_64`
ARCH=''
if [ -n "$OS_ARCH" ]; then
	ARCH=64
fi
JAVA_CMD=java
if [ -f "/usr/share/lexmark/fwu_legacy/jre/bin/java" ]; then
	JAVA_CMD="/usr/share/lexmark/fwu_legacy/jre/bin/java"
elif [ -f "/usr/share/lexmark/wsu_legacy/jre/bin/java" ]; then
	JAVA_CMD="/usr/share/lexmark/wsu_legacy/jre/bin/java"
elif [ -f "/usr/share/lexmark/legacy/jre/bin/java" ]; then
	JAVA_CMD="/usr/share/lexmark/legacy/jre/bin/java"
elif [ -f "/usr/bin/java" ]; then
	JAVA_CMD="/usr/bin/java"
elif [ -f "/etc/alternatives/java" ]; then
	JAVA_CMD="/etc/alternatives/java"
else
	exit 1
fi
${JAVA_CMD} -Djava.library.path=/usr/share/lexmark/legacy/lib${ARCH} -Ddbus=mdwapclss.apps.umframework.DBusProxyLegacy -classpath /usr/share/lexmark/legacy/jar/debug-disable-1.1.jar:/usr/share/lexmark/legacy/jar/hexdump-0.2.jar:/usr/share/lexmark/legacy/jar/libdbus-java-2.6.jar:/usr/share/lexmark/legacy/jar/unix-0.5.jar:/usr/share/lexmark/legacy/jar/xpp3_min-1.1.4c.jar:/usr/share/lexmark/legacy/jar/xstream-1.3.1.jar:/usr/share/lexmark/legacy/jar/uiframework.jar:/usr/share/lexmark/legacy/jar/tools.jar:/usr/share/lexmark/legacy/jar/devicecore.jar:/usr/share/lexmark/legacy/jar/config.jar:/usr/share/lexmark/legacy/jar/localize.jar:/usr/share/lexmark/legacy/jar/umframework.jar mdwapclss.apps.umframework.UserMessagingFramework
