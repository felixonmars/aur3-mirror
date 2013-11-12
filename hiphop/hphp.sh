#!/bin/sh
export CMAKE_PREFIX_PATH=/opt/hiphop/
export HPHP_HOME=$CMAKE_PREFIX_PATH/hiphop-php
export HPHP_LIB=$HPHP_HOME/bin
$HPHP_HOME/hphp/hhvm/hhvm $*
