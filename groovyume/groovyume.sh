#!/bin/sh

# Create a variable equal to $HOME that will be used later in the ini creation
home=('$HOME')

if [ "$1" != "" ] && [ "$1" = "--newini" ]; then
  echo "Rebuilding the ini file at $HOME/.ume/ume.ini"
  echo "Modify this file for permanent changes to your GroovyUME"
  echo "options and paths before running GroovyUME again."
  cd $HOME/.ume
  if [ -e ume.ini ]; then
    echo "Your old ini file has been renamed to umeini.bak"
    mv ume.ini umeini.bak
  fi
  /usr/share/groovyume/groovyume \
    -artpath "$home/.ume/artwork;artwork" \
    -ctrlrpath "$home/.ume/ctrlr;ctrlr" \
    -inipath $home/.ume/ini \
    -rompath $home/.ume/roms \
    -samplepath $home/.ume/samples \
    -cfg_directory $home/.ume/cfg \
    -comment_directory $home/.ume/comments \
    -diff_directory $home/.ume/diff \
    -input_directory $home/.ume/inp \
    -memcard_directory $home/.ume/memcard \
    -nvram_directory $home/.ume/nvram \
    -snapshot_directory $home/.ume/snap \
    -state_directory $home/.ume/sta \
    -video opengl \
    -createconfig
elif [ ! -e $HOME/.ume ]; then
  echo "Running GroovyUME for the first time..."
  echo "Creating an ini file for GroovyUME at $HOME/.ume/ume.ini"
  echo "Modify this file for permanent changes to your GroovyUME"
  echo "options and paths before running GroovyUME again."
  mkdir $HOME/.ume
  mkdir $HOME/.ume/{artwork,cfg,comments,ctrlr,diff,ini,inp,memcard,nvram,samples,snap,sta,roms}
  cd $HOME/.ume
  /usr/share/groovyume/groovyume \
    -artpath "$home/.ume/artwork;artwork" \
    -ctrlrpath "$home/.ume/ctrlr;ctrlr" \
    -inipath $home/.ume/ini \
    -rompath $home/.ume/roms \
    -samplepath $home/.ume/samples \
    -cfg_directory $home/.ume/cfg \
    -comment_directory $home/.ume/comments \
    -diff_directory $home/.ume/diff \
    -input_directory $home/.ume/inp \
    -memcard_directory $home/.ume/memcard \
    -nvram_directory $home/.ume/nvram \
    -snapshot_directory $home/.ume/snap \
    -state_directory $home/.ume/sta \
    -video opengl \
    -createconfig
else
  cd /usr/share/groovyume
  ./groovyume "$@"
fi
