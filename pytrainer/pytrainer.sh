#!/bin/sh
# First arg is log level, e.g. -d for DEBUG

export LD_LIBRARY_PATH=/usr/lib/firefox

# Building xulrunner path to avoid problems when upgrading
PATH_XULRUNNER=/usr/lib
XULRUNNER_VERSION=`ls "$PATH_XULRUNNER" | grep -m1 xulrunner`
export MOZILLA_FIVE_HOME="$PATH_XULRUNNER/$XULRUNNER_VERSION"

cd /usr/share/pytrainer
python2 pytrainer "$@"
