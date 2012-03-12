#!/bin/sh
mkdir -p ~/.jpcsp
cd ~/.jpcsp
java -Xmx512m -Djava.library.path=/opt/jpcsp/lib/linux-amd64 -jar "/opt/jpcsp/bin/jpcsp.jar"
