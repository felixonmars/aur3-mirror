#!/bin/bash

set -e

mkdir -p ~/.appdata/Adobe/AIR
[ ! -f ~/.appdata/Adobe/AIR/eulaAccepted ] && cp /opt/devolo/dlancockpit/share/eulaAccepted ~/.appdata/Adobe/AIR

/opt/devolo/dlancockpit/bin/dlancockpit |   while read a b; do if [ "$a" = "OPEN" ]; then xdg-open $b; fi; done

