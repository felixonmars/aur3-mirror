# set JAVA_HOME
[ -f /etc/profile.d/jre.sh ] && . /etc/profile.d/jre.sh
[ -f /etc/profile.d/jdk.sh ] && . /etc/profile.d/jdk.sh
[ -f /etc/profile.d/openjdk6.sh ] && . /etc/profile.d/openjdk6.sh
# or set your variant
#JAVA_HOME=/somewhere

# Tomcat's variables
TOMCAT_USER=tomcat
CATALINA_HOME=/usr/share/tomcat
CATALINA_BASE=$CATALINA_HOME
CATALINA_CONF=/etc/tomcat.d
CATALINA_TMP=/tmp
CATALINA_LOG=/var/log/tomcat
CATALINA_PID=/var/run/tomcat.pid
CLASSPATH=$CATALINA_HOME/bin/commons-daemon.jar:$CATALINA_HOME/bin/bootstrap.jar
#CATALINA_OPTS=

