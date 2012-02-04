#!/bin/bash

######## CONFIGURATION OPTIONS ########
JAVA_PROGRAM_DIR="/opt/java/jre/bin/"
PROGRAM_DIR="/usr/share/arbaro"
#######################################


#Make home directory

if [ -e $HOME/arbaro/ ]
then
	cd $HOME/arbaro/
	java -jar $PROGRAM_DIR/arbaro.jar
	
	exit 0
else
		mkdir $HOME/arbaro/
		mkdir $HOME/arbaro/{pov,trees}
		cp $PROGRAM_DIR/pov/*.* $HOME/arbaro/pov
		cp $PROGRAM_DIR/trees/*.* $HOME/arbaro/trees
	cd $HOME/arbaro/
	java -jar $PROGRAM_DIR/arbaro.jar
fi
