#! /bin/sh

# muCommander startup arguments
MUCOMMANDER_ARGS=""
JAVA_ARGS="-Djava.system.class.loader=com.mucommander.commons.file.AbstractFileClassLoader"

# Locates the java executable.
if [ "$JAVA_HOME" != "" ] ; then
    JAVA=$JAVA_HOME/bin/java
else
    JAVACMD=`which java 2> /dev/null `
    if [ -z "$JAVACMD" ] ; then
        echo "Error: cannot find java VM."
        exit 1
    else
        JAVA=java
    fi
fi

# Starts mucommander.
$JAVA $JAVA_ARGS -DGNOME_DESKTOP_SESSION_ID=$GNOME_DESKTOP_SESSION_ID -DKDE_FULL_SESSION=$KDE_FULL_SESSION -DKDE_SESSION_VERSION=$KDE_SESSION_VERSION -jar /usr/share/mucommander/mucommander.jar $MUCOMMANDER_ARGS "$@"
