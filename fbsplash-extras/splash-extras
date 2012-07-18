#!/bin/bash

# /etc/conf.d/splash-extras
#
# Supplement /etc/conf.d/splash

## Configuration for fbsplash-chvt
# Change to or stay on the Splash VT before Xorg is started from inittab
# to prevent it from changing to somewhere else on shutdown.
# Change to console for other runlevels to avoid black screen after
# exiting the splash or X.
# List of runlevels starting Xorg from /etc/inittab:
SPLASH_XLEVELS=( 5 )
# To enable this also for changing between runlevels,
# insert into /etc/inittab before Xorg start (login manager section):
#
#  ### fbsplash-extras: Change to/from splash VT on Runlevel Changes
#  fse2:2:wait:fbsplash-chvt
#  fse3:3:wait:fbsplash-chvt
#  fse4:4:wait:fbsplash-chvt
#  fse5:5:wait:fbsplash-chvt
#

## Configuration for fbsplash-controld
# Learn and use services start/stop times for smooth progress-bar or -animation
SPLASH_SMOOTH_PROGRESS="yes"
# Push initscripts status messages only when no progress for at least one second
# (overriding /etc/conf.d/splash SPLASH_PUSH_MESSAGE.)
SPLASH_PUSH_DELAY="yes"

## Special case: Exit the splash at the end of /etc/rc.sysinit
# (overriding /etc/conf.d/splash SPLASH_XSERVICE)
#SPLASH_XSERVICE="fbsplash-boot-dummy"

# EOF #
