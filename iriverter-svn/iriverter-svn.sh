#!/bin/sh
/usr/bin/java -Djava.library.path=/usr/lib/ \
    -classpath /usr/lib/iriverter-svn/iriverter-svn.jar:/usr/share/java/swt.jar \
    org.thestaticvoid.iriverter.ConverterUI $*
