#!/bin/sh
export IDEA_JDK=$JAVA_HOME
exec /usr/share/intellij-idea-13-ultimate/bin/idea.sh "$@"
