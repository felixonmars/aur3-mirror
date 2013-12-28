#!/bin/bash
CONFIG_DIR=${XDG_CONFIG_HOME:-$HOME/.multimc5-kopsy}
mkdir -p $CONFIG_DIR
/usr/lib/multimc5-kopsy/MultiMC5-kopsy -d $CONFIG_DIR
