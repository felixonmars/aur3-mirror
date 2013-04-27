#!/bin/sh

cd /usr/share/java/protege

CMD_OPTIONS="-Dapple.laf.useScreenMenuBar=true -Xdock:name=Protege" sh run.sh $@
