#!/bin/sh

#export LD_LIBRARY_PATH=/usr/lib:$LD_LIBRARY_PATH
#export PYTHONPATH=$GUROBI_HOME:$PYTHONPATH
export PYTHONSTARTUP=/usr/lib/gurobi/gurobi.py

python2.7 $*
