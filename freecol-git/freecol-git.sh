#!/bin/bash

FC_PATH=/usr/share/java/freecol-git
java -Xms4096M -Xmx4096M -jar $FC_PATH/FreeCol.jar "$@" --freecol-data $FC_PATH/data
