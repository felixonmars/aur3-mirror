#!/bin/sh
cd /opt/Shadowrun\ Returns
if [ -z $XDG_CONFIG_HOME ]; then
        SAVEDIR="$HOME/.config/Harebrained Schemes/Shadowrun Returns"
else
        SAVEDIR="$XDG_CONFIG_HOME/Harebrained Schemes/Shadowrun Returns"
fi
if [ ! -d "$SAVEDIR/DumpBox" ]; then
        mkdir "$SAVEDIR/DumpBox"
fi
ln -s "$SAVEDIR/DumpBox" /tmp/Shadowrun\ Returns
/opt/Shadowrun\ Returns/start.sh
rm /tmp/Shadowrun\ Returns
