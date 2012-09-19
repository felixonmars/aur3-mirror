#!/bin/bash
#Setup install path
_ip='/usr/share/java/stellarforces'
#setup classpath variable
for jar in $(/usr/bin/find /usr/share/java/stellarforces/ -iname "*.jar"); do _cp=$_cp:$jar; done
_cp=$_cp:$_ip/bin
#change directory to stellarforces install path
cd $_ip
#Start Stellarforces
/usr/bin/java -XX:-HeapDumpOnOutOfMemoryError -Xms256m -Xmx1024m -Djava.library.path="$_ip/libs/jme/lib/natives" -cp $_cp dsr.start.StartupNew $*
