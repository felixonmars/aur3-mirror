#!/bin/bash
CLASSPATH="/usr/share/java/josm/josm.jar"
java -cp "${CLASSPATH}" org.openstreetmap.josm.gui.MainApplication "$@"
