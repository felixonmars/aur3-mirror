#!/bin/sh

# Create a variable equal to $HOME that will be used later in the ini creation
home=('$HOME')

if [ "$1" != "" ] && [ "$1" = "--newini" ]; then
  echo "Rebuilding the ini file at $HOME/.ume/ume.ini"
  echo "Modify this file for permanent changes to your SDLUME"
  echo "options and paths before running SDLUME again."
  
  cd "$HOME/.ume"
  if [ -e ume.ini ]; then
    echo "Your old ini file has been renamed to ume.ini.bak"
    mv ume.ini ume.ini.bak
  fi
  
  /usr/share/sdlume/sdlume \
    -artpath "$home/.ume/artwork;artwork" \
    -ctrlrpath "$home/.ume/ctrlr;ctrlr" \
    -hashpath "$home/.ume/hash;hash" \
    -inipath "$home/.ume/ini" \
    -rompath "$home/.ume/roms;$home/.ume/bios;$home/.mame/roms;$home/.mame/bios;$home/.mess/roms;$home/.mess/bios" \
    -samplepath "$home/.ume/samples" \
    -cfg_directory "$home/.ume/cfg" \
    -comment_directory "$home/.ume/comments" \
    -diff_directory "$home/.ume/diff" \
    -input_directory "$home/.ume/inp" \
    -memcard_directory "$home/.ume/memcard" \
    -nvram_directory "$home/.ume/nvram" \
    -snapshot_directory "$home/.ume/snap" \
    -state_directory "$home/.ume/sta" \
    -video opengl \
    -createconfig
elif [ ! -e $HOME/.ume ]; then
  echo "Running SDLUME for the first time..."
  echo "Creating an ini file for SDLUME at $HOME/.ume/ume.ini"
  echo "Modify this file for permanent changes to your SDLUME"
  echo "options and paths before running SDLUME again."
  mkdir $HOME/.ume
  mkdir $HOME/.ume/{artwork,bios,cfg,cheat,comments,ctrlr,diff,hash,ini,input,memcard,nvram,roms,samples,snap,software,sta,tools}
  cd $HOME/.ume
  /usr/share/sdlume/sdlume \
    -artpath "$home/.ume/artwork;artwork" \
    -ctrlrpath "$home/.ume/ctrlr;ctrlr" \
    -hashpath "$home/.ume/hash;hash" \
    -inipath "$home/.ume/ini" \
    -rompath "$home/.ume/roms;$home/.ume/bios;$home/.mame/roms;$home/.mame/bios;$home/.mess/roms;$home/.mess/bios" \
    -samplepath "$home/.ume/samples" \
    -cfg_directory "$home/.ume/cfg" \
    -comment_directory "$home/.ume/comments" \
    -diff_directory "$home/.ume/diff" \
    -input_directory "$home/.ume/inp" \
    -memcard_directory "$home/.ume/memcard" \
    -nvram_directory "$home/.ume/nvram" \
    -snapshot_directory "$home/.ume/snap" \
    -state_directory "$home/.ume/sta" \
    -video opengl \
    -createconfig
else
  cd /usr/share/sdlume
  ./sdlume "$@"
fi
