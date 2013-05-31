#!/bin/sh

export IDEA_JDK="$JAVA_HOME"

exec /usr/share/intellij_idea_ue_13_eap/bin/idea.sh nosplash $*

