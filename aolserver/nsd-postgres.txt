#!/bin/bash

# aolserver4 recommends descriptors limit (FD_SETSIZE) to be set to 1024, 
# which is standard for most OS distributions
# For freebsd systems, uncomment following line:
# ulimit -n 1024

export PATH=$PATH:/usr/share/postgres/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/share/postgresql/lib:/opt/aolserver/lib

exec /opt/aolserver/bin/nsd $*
