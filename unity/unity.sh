# Select unity profile if we are in the default session.
# The default profile is used otherwise.

if [ "x$DESKTOP_SESSION" = "xunity" ]; then
    COMPIZ_CONFIG_PROFILE="unity"
    export COMPIZ_CONFIG_PROFILE
fi

