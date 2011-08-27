#!/bin/sh

# INSTRUCTIONS
#  1) Install Java 1.5 or later for Linux (http://java.com/download/)
#  2) Download Mac OS X Version and Unzip in desired location
#  3) Place this launcher script next to the application bundle 
#  4) Execute script to launch CRON-o-Meter

cd "/usr/lib/cronometer/"
java -cp cronometer.jar:jcommon-1.0.10.jar:jfreechart-1.0.6.jar:swingx-0.9.3.jar:cronometer.jar:usda_sr22.jar:crdb_004.jar:docs.jar ca.spaz.cron.CRONOMETER
