#!/bin/bash
# Author: Emil Lundberg <lundberg.emil@gmail.com>
#
# Checks if the named config file exists, and creates it if necessary.
#
# This script will create a default BitTorrent Sync configuration file
# at $configPath, if it does not already exist. $configPath is the value
# of the first positional parameter if it exists, and
# ~/.config/btsync/btsync.conf if it does not exist.
#
# The script /usr/share/btsync-autoconfig/btsync-makeconfig.sh will be used to
# create the config file. No arguments will be given to the btsync-makeconfig.sh
# script.
#
# If creation of the config file fails, the script exits with nonzero
# exit status.
#
# Exit status codes:
#   0 The script was executed successfully.
#   1 The config file did not exist and the script failed to create its
#     parent directory
#   2 The config file did not exist, its parent directory did exist or
#     was successfully created, and the script failed to create the
#     file.

logger "$0 starting"

configPath=~/.config/btsync/btsync.conf

# Parse arguments
if [[ $# > 0 ]]; then
    configPath=$1
    logger "Using config path $configPath given as positional parameter"
else
    logger "Using default config path $configPath"
fi

# Create config file if necessary
if [[ -f $configPath ]]; then
    logger "Config file $configPath already exists - nothing to do!"
    exit 0
else
    logger "File $configPath does not exist - will create config file at this location"

    if mkdir -p $(dirname $configPath); then
        if /bin/bash /usr/share/btsync-autoconfig/btsync-makeconfig.sh > $configPath; then
            logger "Config file successfully created at $configPath!"
            exit 0
        else
            logger "Could not create config at $configPath - exiting"
            exit 2
        fi
    else
        logger "Could not create directory $(dirname $configPath) - exiting"
        exit 1
    fi
fi

# vim: ts=4:sw=4:et
