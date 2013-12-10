#!/usr/bin/env bash

arch=$(uname -m)
if [ "$arch" == 'x86_64' ]; then
  arch="x86_64"
else
  arch="i386"
fi

file=`basename "$0"`
if [ "$file" == 'openarena' ]; then
  file='openarena'
else
  file='oa_ded'
fi

cd '/opt/openarena'
"./${file}.${arch}"
