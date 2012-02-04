#!/bin/sh
if ! [ -d "$HOME/.istmusic" ]; then mkdir "$HOME/.istmusic"; fi
if [ $# -gt 0 ]; then
  case "$1" in
    /*)
      CONFIG_PATH="$1"
      break
      ;;
    *)
      CONFIG_PATH="$PWD/$1"
      ;;
  esac
  if [ -f $CONFIG_PATH ]; then
    CONFIG_PROP="-Dfelix.config.properties=file:$CONFIG_PATH"
  else
    echo "Configuration file $CONFIG_PATH is not available. Considering the default one."
  fi
fi
cd /usr/share/java/istmusic
java $CONFIG_PROP -jar bin/felix.jar "$HOME/.istmusic/felix-cache" 
