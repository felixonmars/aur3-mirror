#!/bin/sh
if [ ! -f $GRIFFON_HOME/startGriffon ]; then
  GRIFFON_HOME=/usr/share/griffon
fi
DIRNAME=$GRIFFON_HOME
. "$DIRNAME/startGriffon"
startGriffon org.codehaus.griffon.cli.GriffonScriptRunner "$@"
