#!/bin/bash

export KF5="/opt/kf5"
export XDG_CONFIG_DIRS="$KF5/etc/xdg:/etc/xdg"
export QT_PLUGIN_PATH="$KF5/lib/qt/plugins:/usr/lib/qt/plugins"
export QML2_IMPORT_PATH="$KF5/lib/qt/qml:/usr/lib/qt/qml"
export LIBEXEC_PATH="$KF5/lib/libexec:/usr/lib/libexec"
export LD_LIBRARY_PATH="$KF5/lib"
