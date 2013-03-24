#!/bin/bash
CONFIG_DIR=${XDG_CONFIG_HOME:-$HOME/.config/multimc}
mkdir -p $CONFIG_DIR
/usr/lib/multimc/MultiMC -d $CONFIG_DIR
