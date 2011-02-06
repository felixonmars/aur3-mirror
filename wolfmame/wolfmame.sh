#!/bin/sh

# Create a variable equal to $HOME that will be used later in the ini creation
home=('$HOME')

if [ "$1" != "" ] && [ "$1" = "--newini" ]; then
  echo "Rebuilding the ini file at $HOME/.mame/mame.ini"
  echo "Modify this file for permanent changes to your WolfMAME"
  echo "options and paths before running WolfMAME again."
  cd $HOME/.mame
  if [ -e mame.ini ]; then
    echo "Your old ini file has been renamed to mameini.bak"
    mv mame.ini mameini.bak
  fi
  /usr/share/wolfmame/wolfmame \
    -artpath "$home/.mame/artwork;artwork" \
    -ctrlrpath "$home/.mame/ctrlr;ctrlr" \
    -inipath $home/.mame/ini \
    -rompath $home/.mame/roms \
    -samplepath $home/.mame/samples \
    -cfg_directory $home/.mame/cfg \
    -comment_directory $home/.mame/comments \
    -diff_directory $home/.mame/diff \
    -input_directory $home/.mame/inp \
    -memcard_directory $home/.mame/memcard \
    -nvram_directory $home/.mame/nvram \
    -snapshot_directory $home/.mame/snap \
    -state_directory $home/.mame/sta \
    -video opengl \
    -createconfig
elif [ ! -e $HOME/.mame ]; then
  echo "Running WolfMAME for the first time..."
  echo "Creating an ini file for WolfMAME at $HOME/.mame/mame.ini"
  echo "Modify this file for permanent changes to your WolfMAME"
  echo "options and paths before running WolfMAME again."
  mkdir $HOME/.mame
  mkdir $HOME/.mame/{artwork,cfg,comments,ctrlr,diff,ini,inp,memcard,nvram,samples,snap,sta}
  cd $HOME/.mame
  /usr/share/wolfmame/wolfmame \
    -artpath "$home/.mame/artwork;artwork" \
    -ctrlrpath "$home/.mame/ctrlr;ctrlr" \
    -inipath $home/.mame/ini \
    -rompath $home/.mame/roms \
    -samplepath $home/.mame/samples \
    -cfg_directory $home/.mame/cfg \
    -comment_directory $home/.mame/comments \
    -diff_directory $home/.mame/diff \
    -input_directory $home/.mame/inp \
    -memcard_directory $home/.mame/memcard \
    -nvram_directory $home/.mame/nvram \
    -snapshot_directory $home/.mame/snap \
    -state_directory $home/.mame/sta \
    -video opengl \
    -createconfig
else
  cd /usr/share/wolfmame
  ./wolfmame "$@"
fi
