#!/bin/bash
if [ ! -d "$HOME/.epacse" ] ; then
   mkdir -p "$HOME/.epacse/save/"
   cp /usr/share/epacse/settings.conf "$HOME/.epacse/"
   ln -s /usr/share/epacse/data "$HOME/.epacse/data"
   ln -s /usr/share/epacse/epacse "$HOME/.epacse/epacse"
fi
cd "$HOME/.epacse/"
./epacse

