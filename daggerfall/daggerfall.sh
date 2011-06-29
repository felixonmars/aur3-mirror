#!/bin/bash

run_fixsave=false
run_fixmaps=false
run_setup=false

for arg in "$@"
do
  if [[ $arg == --fixsave ]]
  then
    run_fixsave=true
  fi
  if [[ $arg == --fixmaps ]]
  then
    run_fixmaps=true
  fi
  if [[ $arg == --setup ]]
  then
    run_setup=true
  fi
done

if $run_setup
then
  conf=dagger-setup.conf
else
  if $run_fixsave
  then
    conf=dagger-fixsave.conf
  else
    if $run_fixmaps
    then
      conf=dagger-fixmaps.conf
    else
      conf=dagger.conf
    fi
  fi
fi

dosbox -conf /usr/share/games/daggerfall/$conf

