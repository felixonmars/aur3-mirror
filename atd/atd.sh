#!/bin/bash
cd /opt/atd

low_mem=true

for arg in "$@"
do
  if [[ $arg == -b ]]
  then
    low_mem=false
  fi
  if [[ $arg == --bigmem ]]
  then
    low_mem=false
  fi
done

if $low_mem
then
  ./run-lowmem.sh
else
  ./run.sh
fi

