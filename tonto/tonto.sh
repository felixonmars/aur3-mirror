#!/usr/bin/env bash

# Make sure we can find `java`
TEST_JAVA=$(which java)
if [ $? -ne 0 ]; then
    zenity --error --text "No Java VM was found in your path. If Java was just installed try logging out and back in again."
    exit 1
fi

# Configure the tonto directories
TONTODIR="/opt/tonto"
if [ -d ${TONTODIR}/lib ]; then
    export LD_LIBRARY_PATH="${TONTODIR}/lib"
fi

# Additional VM flags for that may be required for handling of very large CCF files.
MEM="-Xms64M -Xmx256M"

# launch Tonto
java ${MEM} -jar "${TONTODIR}/tonto.jar" $*
