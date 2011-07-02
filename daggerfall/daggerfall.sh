#!/bin/bash

run_fixsave=false
run_fixmaps=false
run_setup=false
run_game=true
requests=1

for arg in "$@"
do
  if [[ $arg == --fixsave ]]
  then
    run_fixsave=true
    if $run_game
    then
      run_game=false
    else
      requests=$(($requests+1))
    fi
  fi
  if [[ $arg == --fixmaps ]]
  then
    run_fixmaps=true
    if $run_game
    then
      run_game=false
    else
      requests=$(($requests+1))
    fi
  fi
  if [[ $arg == --setup ]]
  then
    run_setup=true
    if $run_game
    then
      run_game=false
    else
      requests=$(($requests+1))
    fi
  fi
  if [[ $arg == --accept ]]
  then
    touch /usr/share/games/daggerfall/terms-accepted
  fi
done

if [ $requests != "1" ]
then
  echo "you can request at most one of --fixmaps, --fixsave and --setup"
  exit 1
fi

if [ -f /usr/share/games/daggerfall/terms-accepted ]
then

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

else
cat /usr/share/licenses/daggerfall/license
while true
do

read -p "Do you accept the license? (yes/no)"
if [ "$REPLY" == "yes" ]
then
  $0 $@ --accept
  break
else
  if [ "$REPLY" == "no" ]
  then
    echo "You should uninstall Daggerfall at once!"
    break
  else
    echo "Please answer with yes or no"
  fi
fi

done
fi

