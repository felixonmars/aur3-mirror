#!/bin/sh
mkdir -p ~/.jpcsp
cd ~/.jpcsp
java -Xmx512m -Djava.library.path=/opt/jpcsp/lib/linux-x86 -jar "/opt/jpcsp/bin/jpcsp.jar"
