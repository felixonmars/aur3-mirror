#!/bin/sh
# 
# This script wraps the nodm program in order to read the
# configuration options that are set in /etc/nodm.conf

if [ -f /etc/nodm.conf ]; then
    . /etc/nodm.conf
fi

NODM_USER=$NODM_USER NODM_XSESSION=$NODM_XSESSION NODM_X_OPTIONS=$NODM_X_OPTIONS NODM_MIN_SESSION_TIME=$NODM_MIN_SESSION_TIME NODM_XINIT=$NODM_XINIT NODM_RESTART_SESSION=$NODM_RESTART_SESSION /usr/sbin/nodm
