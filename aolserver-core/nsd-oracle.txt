#!/bin/sh

export ORACLE_HOME="/ora8/m01/app/oracle/product/8.1.7"
export ORACLE_BASE="/ora8/m01/app/oracle"
export LD_LIBRARY_PATH=$ORACLE_HOME/lib:$ORACLE_HOME/ctx/lib:/usr/lib:/lib:/usr/X11R6/lib
export PATH=$ORACLE_HOME/bin:$ORACLE_HOME/ctx/lib:$PATH
export ORACLE_SID='ora8'
export ORACLE_TERM='vt100'
export ORAENV_ASK=NO
export NLS_DATE_FORMAT="YYYY-MM-DD"
export LD_ASSUME_KERNEL=2.2.5
exec /opt/aolserver/bin/nsd $*
