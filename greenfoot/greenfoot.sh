#!/bin/sh
APPBASE="/usr/share/greenfoot"
CP="$APPBASE/lib/bluej.jar:$APPBASE/lib/junit.jar:$APPBASE/lib/bluejcore.jar:$APPBASE/lib/bluejext.jar:$APPBASE/lib/bluejeditor.jar:$APPBASE/lib/editor.jar:$APPBASE/lib/antlr.jar:/opt/java/lib/tools.jar:$APPBASE/lib/MRJ141Stubs.jar:$APPBASE/lib/extensions/greenfoot.jar"
`which java` -cp "$CP" bluej.Boot -greenfoot=true -bluej.compiler.showunchecked=false $*
