#!/bin/bash

first_option=true
run_dosbox=true
show_help=false
store_pal=false
restore_pal=false
switch_skills=false
set_gamma=false
set_wagon=false
restore_noask=false
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

  if [[ $arg == --high-skills ]]
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

  if [[ $arg == --high-skills=* ]]
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

  if [[ $arg == --wagon-capacity ]]
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

  if [[ $arg == --wagon-capacity=* ]]
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

  if [[ $arg == --store-palettes ]]
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

  if [[ $arg == --restore-palettes ]]
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

  if [[ $arg == --list-saves ]]
  then
    option_recognized=true
    if $first_option
    then
      list_saves=true
      list_mode="full"
      run_dosbox=false
      first_option=false
    else
      requests=$(($requests+1))
    fi
  fi

  if [[ $arg == --list-saves=* ]]
  then
    option_recognized=true
    if $first_option
    then
      list_mode=`echo $arg | sed 's/.*=//'`
      if [[ $list_mode != "full" ]]
      then
        if [[ $list_mode != "current" ]]
        then
          if [[ $list_mode != "backup" ]]
          then
            option_recognized=false
          fi
        fi
      fi
      list_saves=true
      run_dosbox=false
      first_option=false
    else
      requests=$(($requests+1))
    fi
  fi

  if [[ $arg == --backup-save=* ]]
  then
    option_recognized=true
    if $first_option
    then
      saveslot=`echo $arg | sed 's/.*=//'`
      store_save=true
      run_dosbox=false
      first_option=false
    else
      requests=$(($requests+1))
    fi
  fi

  if [[ $arg == --restore-dont-ask ]]
  then
    option_recognized=true
    restore_noask="true"
    run_dosbox=false
    first_option=false
  fi

  if [[ $arg == --restore-to=* ]]
  then
    option_recognized=true
    restore_to=`echo $arg | sed 's/.*=//'`
    restore_save_to=true
    run_dosbox=false
    first_option=false
  fi

  if [[ $arg == --restore-save=* ]]
  then
    option_recognized=true
    if $first_option
    then
      data=`echo $arg | sed 's/=/\xff/;s/.*\xff//'`
      fields=`echo $data | sed 's/-/\n/g' | wc -l`
      bad=false
      if [[ $fields == "1" ]]
      then
        if [[ $data == [0-6] ]]
        then
          if [ -f /usr/share/games/daggerfall/DAGGER/SAVE$data/SAVENAME.TXT ]
          then
            index=`grep -PUbo --binary-file=text '\x0' /usr/share/games/daggerfall/DAGGER/SAVE$data/SAVENAME.TXT | head -1 | sed 's/:.*//'`
            name=`head -c $index /usr/share/games/daggerfall/DAGGER/SAVE$data/SAVENAME.TXT`
            data="$data-$name"
          else
            bad=true
          fi
        else
          bad=true
        fi
      fi
      if [[ $bad == "false" ]]
      then
        fields=`echo $data | sed 's/-/\n/g' | wc -l`
        if [[ $fields == "2" ]]
        then
          names=`ls /usr/share/games/daggerfall/backup | grep "-" | sed 's/.tar.xz//' | grep "$data"`
          if [[ `echo $names | wc -l` == 0 ]]
          then
            bad=true
          else
            data=`ls /usr/share/games/daggerfall/backup | grep "-" | sed 's/.tar.xz//' | grep "$data" | tail -1`
          fi
        fi
        if [[ $bad == "false" ]]
        then
          found=`ls /usr/share/games/daggerfall/backup | grep "-" | sed 's/.tar.xz//' | grep "$data" | wc -l`
          if [[ $found != 1 ]]
          then
            bad=true
          fi
        fi
      fi
      restore_save=true
      run_dosbox=false
      first_option=false
    else
      requests=$(($requests+1))
    fi
  fi

  if [[ $arg == --accept-license ]]
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

if [[ $restore_noask == "true" ]]
then
  if [[ $restore_save != "true" ]]
  then
    $0 --help
    exit 1
  fi
fi
if [[ $restore_save_to == "true" ]]
then
  if [[ $restore_save != "true" ]]
  then
    $0 --help
    exit 1
  fi
else
  if [[ $restore_save == "true" ]]
  then
    restore_to=`echo $data | head -c 1`
  fi
fi

if [[ $restore_save == "true" ]]
then
  if [[ $bad == "true" ]]
  then
    $0 --help
    exit 1
  fi
fi

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
echo "  --setup                 run the sound setup utility"
echo "  --fixsave               run fixsave, the save game fixing utility"
echo "  --fixmaps               run fixmaps, the map fixing utility"
echo "  --store-palettes        store current palettes (overwrite previously stored palettes)"
echo "  --restore-palettes      restore previously store palettes (restores the original"
echo "                          Daggerfall palettes if no palettes were stored before)"
echo "  --gamma=value           set gamma in palettes to specified value"
echo "                          (values between 1.2 and 2.0 are reasonable)"
echo "  --high-skills=opt       run tool to enable (on, default)/disable (off) skill advance beyond 100"
echo "                          (allows to obtain hidden \"Master of (skill)\" at skill levels of 130)"
echo "  --wagon-capacity=value  sets wagon weight capacity to given value (default 750, min 1, max 16000)"
echo "                          all values are in native game units (lbs)"
echo "  --list-saves=opt        lists stored and not stored save games in one of modes"
echo "                          full - lists all stored and current saves (default)"
echo "                          current - lists current saves"
echo "                          backup - lists backed up saves"
echo "  --backup-save=n         backup save from slot n (from 0 to 5)"
echo "  --restore-save=opt      restores backed up save in form (slot)-(name)-(date)-(time)"
echo "                          if only slot given, current name for that slot is assumed"
echo "                          if no date/time is given, latest is assumed"
echo "                          for example: 1, 1-name and 1-name-date-hour are valid values,"
echo "                          you can check --list-saves for list of possible values"
echo "  --restore-to=n          picks slot you want to restore to (also allows to create save copies)"
echo "                          can be used only with --restore-save"
echo "  --restore-dont-ask      assume yes to confirm restore process. Avoid this option unless"
echo "                          you are creating batch scripts"
echo "                          can be used only with --restore-save"
echo ""
echo "available extra options (you can mix those with any other valid options):"
echo "  --accept-license        accept the terms of use"
echo ""
echo "available forcing options (selecting those will discard any other used option):"
echo "  --help                  this help information"
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

if [[ $list_saves == "true" ]]
then
if [[ $list_mode == "backup" ]]
then
if [ -d /usr/share/games/daggerfall/backup ]
then
  if [[ `ls /usr/share/games/daggerfall/backup | wc -l` == "0" ]]
  then
    echo "No stored save games found"
  else
    names=`ls /usr/share/games/daggerfall/backup| grep "^$i-" | sed 's/-/=/;s/.*=//;s/-.*//' | sort | uniq | sed 's/\ /\xff/'`
    ls /usr/share/games/daggerfall/backup | sed 's/.tar.xz//'
  fi
else
  echo "No stored save games found"
fi
fi
if [[ $list_mode == "current" ]]
then
found_save=false
for i in {0..5}
do
  if [ -f /usr/share/games/daggerfall/DAGGER/SAVE$i/SAVENAME.TXT ]
  then
    found_save=true
  fi
done
if [[ $found_save == "true" ]]
then
  for i in {0..5}
  do
    if [ -f /usr/share/games/daggerfall/DAGGER/SAVE$i/SAVENAME.TXT ]
    then
      index=`grep -PUbo --binary-file=text '\x0' /usr/share/games/daggerfall/DAGGER/SAVE$i/SAVENAME.TXT | head -1 | sed 's/:.*//'`
      name=`head -c $index /usr/share/games/daggerfall/DAGGER/SAVE$i/SAVENAME.TXT`
      echo "Save in slot $i: $name"
    fi
  done
else
  echo "No current save games found"
  echo ""
fi
fi
if [[ $list_mode == "full" ]]
then
if [ -d /usr/share/games/daggerfall/backup ]
then
  echo "Stored saves:"
  echo "============="
  echo ""
  for i in {0..5}
  do
    if [[ `ls /usr/share/games/daggerfall/backup | grep "^$i" | wc -l` != "0" ]]
    then
      names=`ls /usr/share/games/daggerfall/backup| grep "^$i-" | sed 's/-/=/;s/.*=//;s/-.*//' | sort | uniq | sed 's/\ /\xff/'`
      echo "Saves for slot $i:"
      echo ""
      for n in $names
      do
        name=`echo $n | sed 's/\xff/\ /'`
        echo "Saves for game \"$name\":"
        ls /usr/share/games/daggerfall/backup | grep "^$i-$name"  | sed 's/.tar.xz//;s/^/\ /'
        echo ""
      done
    else
      echo "No stored save games for slot $i"
      echo ""
    fi
  done
else
  echo "No stored save games found"
  echo ""
fi
echo "Current saves:"
echo "=============="
echo ""
for i in {0..5}
do
  if [ -f /usr/share/games/daggerfall/DAGGER/SAVE$i/SAVENAME.TXT ]
  then
    index=`grep -PUbo --binary-file=text '\x0' /usr/share/games/daggerfall/DAGGER/SAVE$i/SAVENAME.TXT | head -1 | sed 's/:.*//'`
    name=`head -c $index /usr/share/games/daggerfall/DAGGER/SAVE$i/SAVENAME.TXT`
    echo "Save in slot $i: $name"
  else
    echo "No save game in slot $i"
  fi
done
fi
fi

if [[ $store_save == "true" ]]
then
  if [ -f /usr/share/games/daggerfall/DAGGER/SAVE$saveslot/SAVENAME.TXT ]
  then
    index=`grep -PUbo --binary-file=text '\x0' /usr/share/games/daggerfall/DAGGER/SAVE$saveslot/SAVENAME.TXT | head -1 | sed 's/:.*//'`
    name=`head -c $index /usr/share/games/daggerfall/DAGGER/SAVE$saveslot/SAVENAME.TXT`
    filename="$saveslot-$name-`date +%Y:%m:%d-%H:%M:%S`"
    if [ ! -d /usr/share/games/daggerfall/backup ]
    then
      mkdir /usr/share/games/daggerfall/backup
      chmod g+w /usr/share/games/daggerfall/backup
      chgrp games /usr/share/games/daggerfall/backup
    fi
    cd /usr/share/games/daggerfall/DAGGER/SAVE$saveslot
    tar -cJf "../../backup/$filename.tar.xz" *
    chmod g+w "/usr/share/games/daggerfall/backup/$filename.tar.xz"
    chgrp games "/usr/share/games/daggerfall/backup/$filename.tar.xz"
    echo "backed up $filename.tar.xz"
  else
    echo "No save game in slot $saveslot"
  fi
fi

if [[ $restore_save == "true" ]]
then
  echo "Restoring $data to $restore_to"
  if [ -f /usr/share/games/daggerfall/DAGGER/SAVE$restore_to/SAVENAME.TXT ]
  then
    index=`grep -PUbo --binary-file=text '\x0' /usr/share/games/daggerfall/DAGGER/SAVE$restore_to/SAVENAME.TXT | head -1 | sed 's/:.*//'`
    name=`head -c $index /usr/share/games/daggerfall/DAGGER/SAVE$restore_to/SAVENAME.TXT`
    echo "Will overwrite save: $name"
  fi
  if [[ $restore_noask == "false" ]]
  then
    while true
    do
      read -p "Are you sure? (yes/no) "
      if [ "$REPLY" == "yes" ]
      then
        do_restore=true
        break
      else
        if [ "$REPLY" == "no" ]
        then
          do_restore=false
          break
        else
          echo "Please answer with yes or no"
        fi
      fi
    done
  else
    do_restore=true
  fi
  if [[ $do_restore == "true" ]]
  then
    cd /usr/share/games/daggerfall/DAGGER/SAVE$restore_to
    rm -rf ./*
    tar -xJf ../../backup/$data.tar.xz
    chmod -R g+w ./*
    chgrp -R games ./*
  fi
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
chmod -f -R g+w /usr/share/games/daggerfall/DAGGER
chgrp -f -R games /usr/share/games/daggerfall/DAGGER
fi

else
cat /usr/share/licenses/daggerfall/license
while true
do

read -p "Do you accept the license? (yes/no) "
if [ "$REPLY" == "yes" ]
then
  $0 $@ --accept-license
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

