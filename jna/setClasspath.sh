#!/bin/sh

##
# This script will set JNA's classpath variables.
##

JNA_CLASSPATH=/usr/share/java/jna/jna.jar
JNA_PLATFORM_CLASSPATH=/usr/share/java/jna/platform.jar:$JNA_CLASSPATH
