#!/bin/sh
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/cabaretstage
cd /usr/share/cabaretstage
for name in `ls /usr/share/java/cabaretstage/*.jar` ; do
    CP=$CP:$name
done
java -cp $CP -Xms64m -Xmx256m com.cabaret.claptz.stage.main.StandardStage $*
