#!/bin/sh
rm -rf /tmp/.mozilla
rm -rf ~/.mozilla
rm -rf /tmp/.cache/mozilla/firefox
rm -rf ~/.cache/mozilla/firefox
mkdir -p /tmp/.cache/mozilla/firefox
mkdir -p /tmp/.mozilla
ln -s /tmp/.cache/mozilla/firefox ~/.cache/mozilla/firefox 
ln -s /tmp/.mozilla ~/.mozilla
firefox -private-window
