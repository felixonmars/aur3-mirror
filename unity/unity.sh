# This file is sourced by Xsession(5), not executed.
# Add additionnal gconf path depending on selected desktop session.
# Select unity profile for compiz if we are in the unity session.
# The default profile is used otherwise.

GCONF_PREFIX="/usr/share/gconf"
if [ "x$DESKTOP_SESSION" = "xunity" ]; then
    export UNITY_DEFAULTS_PATH='xml:readonly:/etc/gconf/unity.xml.defaults'
    export COMPIZ_CONFIG_PROFILE="unity"
fi

