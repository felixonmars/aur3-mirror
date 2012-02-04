#!/bin/bash
TIME=$(date +%Y.%m.%d.%H.%M.%S)
OUTPUTFILE=/tmp/Recorded_Sound_$TIME.wav
MONITOR=$(pactl list | grep -A2 '^Source #' | grep 'Name: .*\.monitor$' | awk '{print $NF}' | tail -n1)
echo "Recording to $OUTPUTFILE, press Ctrl-C or close this window to stop ..."
parec -d "$MONITOR" | sox -t raw -r 44100 -sLb 16 -c 2 - $OUTPUTFILE
