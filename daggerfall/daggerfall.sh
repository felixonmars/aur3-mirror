#!/bin/bash

first_option=true
run_dosbox=true
show_help=false
store_pal=false
restore_pal=false
switch_skills=false
set_gamma=false
set_wagon=false
requests=1

conf=dagger.conf

for arg in "$@"
do
  option_recognized=false

  if [[ $arg == --fixsave ]]
  then
    option_recognized=true
    if $first_option
    then
      conf=dagger-fixsave.conf
      first_option=false
    else
      requests=$(($requests+1))
    fi
  fi

  if [[ $arg == --fixmaps ]]
  then
    option_recognized=true
    if $first_option
    then
      conf=dagger-fixmaps.conf
      first_option=false
    else
      requests=$(($requests+1))
    fi
  fi

  if [[ $arg == --setup ]]
  then
    option_recognized=true
    if $first_option
    then
      conf=dagger-setup.conf
      first_option=false
    else
      requests=$(($requests+1))
    fi
  fi

  if [[ $arg == --skills ]]
  then
    option_recognized=true
    if $first_option
    then
      conf=dagger-skills.conf
      skillmode="on"
      switch_skills=true
      first_option=false
    else
      requests=$(($requests+1))
    fi
  fi

  if [[ $arg == --skills=* ]]
  then
    option_recognized=true
    if $first_option
    then
      conf=dagger-skills.conf
      skillmode=`echo $arg | sed 's/.*=//'`
      if [[ $skillmode != "on" ]]
      then
        if [[ $skillmode != "off" ]]
        then
          option_recognized=false
        fi
      fi
      switch_skills=true
      first_option=false
    else
      requests=$(($requests+1))
    fi
  fi

  if [[ $arg == --wagon ]]
  then
    option_recognized=true
    if $first_option
    then
      conf=dagger-wagon.conf
      weight=750
      set_wagon=true
      first_option=false
    else
      requests=$(($requests+1))
    fi
  fi

  if [[ $arg == --wagon=* ]]
  then
    option_recognized=true
    if $first_option
    then
      conf=dagger-wagon.conf
      weight=`echo $arg | sed 's/.*=//'`
      set_wagon=true
      first_option=false
    else
      requests=$(($requests+1))
    fi
  fi

  if [[ $arg == --gamma=* ]]
  then
    option_recognized=true
    if $first_option
    then
      conf=dagger-gamma.conf
      gamma=`echo $arg | sed 's/.*=//'`
      if [[ ! -d /usr/share/games/daggerfall/palettes ]]
      then
        store_pal=true
      fi
      set_gamma=true
      first_option=false
    else
      requests=$(($requests+1))
    fi
  fi

  if [[ $arg == --storepalettes ]]
  then
    option_recognized=true
    if $first_option
    then
      store_pal=true
      run_dosbox=false
      first_option=false
    else
      requests=$(($requests+1))
    fi
  fi

  if [[ $arg == --restorepalettes ]]
  then
    option_recognized=true
    if $first_option
    then
      restore_pal=true
      run_dosbox=false
      first_option=false
    else
      requests=$(($requests+1))
    fi
  fi

  if [[ $arg == --accept ]]
  then
    option_recognized=true
    touch /usr/share/games/daggerfall/terms-accepted
    chmod g+w /usr/share/games/daggerfall/terms-accepted
    chgrp games /usr/share/games/daggerfall/terms-accepted
  fi

  if [[ $arg == --help ]]
  then
    option_recognized=true
    show_help=true
  fi

  if [[ $option_recognized == "false" ]]
  then
    echo "Unrecognized option: $arg"
    $0 --help
    exit 1
  fi
done

if [[ $requests != "1" ]]
then
  $0 --help
  exit 1
fi

if [[ $show_help == "true" ]]
then
echo "The Elder Scrolls II: Daggerfall launcher"
echo ""
echo "usage:"
echo "  daggerfall [options]"
echo ""
echo "available conflicting options (you can select at most one of those):"
echo "  --setup            run sound setup utility"
echo "  --fixsave          run savegame fixing utility"
echo "  --fixmaps          run map fixing utility"
echo "  --storepalettes    store current palettes (overwrite previously stored palettes)"
echo "  --restorepalettes  restore previously store palettes (restores the original"
echo "                     palettes if no palettes were stored before)"
echo "  --gamma=value      set gamma in palettes to specified value"
echo "                     (values between 1.2 and 2.0 are reasonable)"
echo "  --skills=(on/off)  run tool to enable (on, default)/disable (off) skill advance beyond 100"
echo "                     (allows to obtain hidden \"Master of (skill)\" at skill levels of 130)"
echo "  --wagon=value      sets wagon weight capacity to given value (default 750, min 1, max 16000)"
echo "                     all values are in native game units (lbs)"
echo ""
echo "available extra options (you can mix those with any other valid options):"
echo "  --accept           accept the terms of use"
echo ""
echo "available forcing options (selecting those will discard any other used option):"
echo "  --help             this help information"
else

if [ -f /usr/share/games/daggerfall/terms-accepted ]
then

if [[ $store_pal == "true" ]]
then
  if [[ ! -d /usr/share/games/daggerfall/palettes ]]
  then
    mkdir /usr/share/games/daggerfall/palettes
    chmod g+w /usr/share/games/daggerfall/palettes
    chgrp games /usr/share/games/daggerfall/palettes
  fi
  cp --preserve=mode,ownership /usr/share/games/daggerfall/DAGGER/DATA/DAGGER.COL /usr/share/games/daggerfall/palettes
  cp --preserve=mode,ownership /usr/share/games/daggerfall/DAGGER/ARENA2/{PAL.RAW,ART_PAL.COL,DANKBMAP.COL,FMAP_PAL.COL,NIGHTSKY.COL,MAP.PAL,OLDMAP.PAL,OLDPAL.PAL,PAL.PAL} /usr/share/games/daggerfall/palettes
  echo "Palette files stored"
fi

if [[ $restore_pal == "true" ]]
then
  cp --preserve=mode,ownership /usr/share/games/daggerfall/palettes/DAGGER.COL /usr/share/games/daggerfall/DAGGER/DATA
  cp --preserve=mode,ownership /usr/share/games/daggerfall/palettes/{PAL.RAW,ART_PAL.COL,DANKBMAP.COL,FMAP_PAL.COL,NIGHTSKY.COL,MAP.PAL,OLDMAP.PAL,OLDPAL.PAL,PAL.PAL} /usr/share/games/daggerfall/DAGGER/ARENA2
  echo "Palette files restored"
fi

if [[ $run_dosbox == "true" ]]
then
if [[ $switch_skills == "true" ]]
then
  if [[ $skillmode == "off" ]]
  then
    sed "s/OPTION/\/u/" /usr/share/games/daggerfall/dagger-skills.skel > /usr/share/games/daggerfall/dagger-skills.conf
    chmod g+w /usr/share/games/daggerfall/dagger-skills.conf
    chgrp games /usr/share/games/daggerfall/dagger-skills.conf
  else
    sed "s/OPTION//" /usr/share/games/daggerfall/dagger-skills.skel > /usr/share/games/daggerfall/dagger-skills.conf
    chmod g+w /usr/share/games/daggerfall/dagger-skills.conf
    chgrp games /usr/share/games/daggerfall/dagger-skills.conf
  fi
fi
if [[ $set_gamma == "true" ]]
then
  sed "s/OPTION/$gamma/" /usr/share/games/daggerfall/dagger-gamma.skel > /usr/share/games/daggerfall/dagger-gamma.conf
  chmod g+w /usr/share/games/daggerfall/dagger-gamma.conf
  chgrp games /usr/share/games/daggerfall/dagger-gamma.conf
fi
if [[ $set_wagon == "true" ]]
then
  sed "s/OPTION/$weight/" /usr/share/games/daggerfall/dagger-wagon.skel > /usr/share/games/daggerfall/dagger-wagon.conf
  chmod g+w /usr/share/games/daggerfall/dagger-wagon.conf
  chgrp games /usr/share/games/daggerfall/dagger-wagon.conf
fi
dosbox -conf /usr/share/games/daggerfall/$conf
fi

else
cat /usr/share/licenses/daggerfall/license
while true
do

read -p "Do you accept the license? (yes/no) "
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
fi

