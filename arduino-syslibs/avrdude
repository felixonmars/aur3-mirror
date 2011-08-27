#!/bin/bash
set -e ; set -u

cmd="/usr/bin/avrdude `echo $* -C/etc/avrdude.conf | sed 's/ -c stk500v1 / -c arduino /' `"

echo "Rewritten commandline: $cmd"
$cmd


