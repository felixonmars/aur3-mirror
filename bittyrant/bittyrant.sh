#!/bin/bash

CLASSPATH="/usr/share/java/bittyrant/Azureus2.jar:/usr/share/java/swt.jar" 
LIBPATH="/usr/lib"

java -Xms16m -Xmx128m -cp "${CLASSPATH}" -Djava.library.path="${LIBPATH}" -Dazureus.install.path="/usr/share/bittyrant" org.gudy.azureus2.ui.swt.Main "$@"
