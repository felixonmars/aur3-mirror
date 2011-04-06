#!/bin/bash
[[ HOME = "" ]] && HOME="/home/liveuser"
FILE=${HOME}/.keybindings
zenity --title="Key bindings" --timeout=10 --height=500 --width=280 --text-info --filename="${FILE}"
