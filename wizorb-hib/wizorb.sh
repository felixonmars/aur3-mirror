#!/usr/bin/env bash

CONFDIR="${HOME}/.Tribute Games"

[[ -d "$CONFDIR" ]] || install -d "$CONFDIR"
[[ -h "${HOME}/Tribute Games" ]] || ln -s "$CONFDIR" "${HOME}/Tribute Games"

cd /opt/wizorb
mono Wizorb.exe
rm "${HOME}/Tribute Games"
