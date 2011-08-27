#!/bin/sh

HG=hg
OPENRPG_BASE=~/.openrpg1
export HG
export OPENRPG_BASE

cd /usr/share/openrpg
/usr/bin/python start_server_gui.py "$@"
