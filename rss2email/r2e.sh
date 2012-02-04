#!/bin/bash
mkdir -p $HOME/.rss2email
cd $HOME/.rss2email
python2 /usr/share/rss2email/bin/rss2email.py feeds.dat "$@"
