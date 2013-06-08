#!/bin/bash -e

## Some (environment) variables
export WINEDEBUG=-all  # Supresses Wine debug messages
DEBUG=yes               # Supresses _all_ output (even that outside of Wine)

if [ ! -d "$HOME"/.nsis ] ; then
   mkdir -p "$HOME"/.nsis
fi
# Make sure our settings get saved in ~/.nsis/
[ ! -f ~/.nsis/NSIS.exe ] && ln -s /usr/share/nsis/NSIS.exe \
  ~/.nsis/NSIS.exe && ln -s /usr/share/nsis/nsisconfig.nsh \
  ~/.nsis/nsisconfig.nsh && ln -s /usr/share/nsis/Bin \
  ~/.nsis/Bin && ln -s /usr/share/nsis/Menu \
  ~/.nsis/Menu && ln -s /usr/share/nsis/Plugins \
  ~/.nsis/Plugins && ln -s /usr/share/nsis/Contrib \
  ~/.nsis/Contrib && ln -s /usr/share/nsis/Include \
  ~/.nsis/Include && ln -s /usr/share/nsis/NSIS.chm \
  ~/.nsis/NSIS.chm && ln -s /usr/share/nsis/Examples \
  ~/.nsis/Examples && ln -s /usr/share/nsis/Docs \
  ~/.nsis/Docs && ln -s /usr/share/nsis/Stubs \
  ~/.nsis/Stubs

# Launch the app
if [ "$DEBUG" = 'no' ]; then
  wine /usr/share/nsis/NSIS.exe &>/dev/null
else
  wine /usr/share/nsis/NSIS.exe
fi