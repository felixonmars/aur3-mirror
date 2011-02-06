#!/bin/bash

# the visual netkit plugin paths (separed by ":")
APP=`which $0`
APP_PATH=${APP/\/visualnetkit-start/}

export VISUAL_NETKIT_PLUGINS="/usr/lib/visualnetkit:$HOME/.visualnetkit/plugins"

$APP_PATH/VisualNetkit
