#!/bin/bash -e

## Some (environment) variables
export WINEDEBUG=-all  # Supresses Wine debug messages
DEBUG=yes               # Supresses _all_ output (even that outside of Wine)
# export WINEDLLOVERRIDES="mshtml="  # Disables HTML rendering (for whatever for)
# export XDG_DATA_HOME=/dev/null   # Prevents the app from writing to ~/.local/share/
                                   # (even though nothing special gets written there anyway)
cd /usr/share
if [ ! -d "$HOME"/.nsis ] ; then
   mkdir -p "$HOME"/.nsis
fi
# Make sure our settings get saved in ~/.nsis/
[ ! -f ~/.nsis/makensisw.exe ] && ln -s /usr/share/nsis/makensisw.exe \
  ~/.nsis/makensisw.exe && ln -s /usr/share/nsis/makensis.exe \
  ~/.nsis/makensis.exe
# Use an array to support multiple files
for i; do  # for i = for i in "$@"
  # Add the path in the Wine form (e.g. "z:/home/user/Desktop/lol.torrent")
  if [ -f /"${i#?:}" ]; then  # The full path is provided elsewhere than / (e.g. through
    files+=(z:"${i#?:}")      # the .desktop) or the Wine path is used
  else
    files+=(z:"$(pwd)/$i")  # Partial or no path at all
  fi
done

# Launch the app
if [ "$DEBUG" = 'no' ]; then
  wine /usr/share/nsis/makensisw.exe "${files[@]}" &>/dev/null
else
  wine /usr/share/nsis/makensisw.exe "${files[@]}"
fi