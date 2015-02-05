#!/bin/sh
export IDEA_JDK=$JAVA_HOME
exec /usr/share/intellij-idea-ce-eap/bin/idea.sh "$@"
