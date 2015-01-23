#!/bin/bash

mkdir -p $HOME/.config/airtame
cd $HOME/.config/airtame

/opt/airtame/bin/airtame-tray-cli $@
