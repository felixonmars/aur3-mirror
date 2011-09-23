#!/bin/bash
cd /opt/desura
export LD_LIBRARY_PATH=./lib:$LD_LIBRARY_PATH
./desura
