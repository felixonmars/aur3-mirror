#!/bin/sh

#
# Copyright (C) 2012 VisoCon GmbH
# Modified by Marco Maso <demind@gmail.com>

cd /opt/ximinds.communicator-1.0.4

local_dir=$(pwd)/lib
echo $local_dir
LD_LIBRARY_PATH=${local_dir} ./communicator "$@" &

