#!/bin/bash
DIR="/opt/papersplease"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$DIR"
cd "$DIR"
./PapersPlease $@
