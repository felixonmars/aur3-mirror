#!/bin/bash

FC_PATH=/usr/share/java/freecol-git

cd $(mktemp -d)
java -Xms2048M -Xmx2048M -jar $FC_PATH/FreeCol.jar "$@" --freecol-data $FC_PATH/data &> ./messages.log
