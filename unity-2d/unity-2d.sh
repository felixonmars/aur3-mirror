# This file is sourced by Xsession(5), not executed.
# Add additionnal gconf path depending on selected desktop session.
# The default profile is used otherwise.

GCONF_PREFIX="/usr/share/gconf"
if [ "x$DESKTOP_SESSION" = "xunity" ] || [ "x$DESKTOP_SESSION" = "xunity-2d" ]; then
    export UNITY2D_DEFAULTS_PATH='xml:readonly:/etc/gconf/unity-2d.xml.defaults'
    export UNITY2D_MANDATORY_PATH='xml:readonly:/etc/gconf/unity-2d.xml.mandatory'
fi

