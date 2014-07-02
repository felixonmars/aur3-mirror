#!/bin/bash
cd /opt/janusvr/
export LD_LIBRARY_PATH=./libs
./janusvr $@
