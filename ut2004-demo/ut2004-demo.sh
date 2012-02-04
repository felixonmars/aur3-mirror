#!/bin/sh
cd /opt/ut2004-demo/System
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:.
exec "./ut2004-bin" $*
