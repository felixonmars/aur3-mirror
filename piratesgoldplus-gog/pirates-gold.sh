#!/bin/bash

umask 002
cd "/opt/Pirates Gold Plus"
sg games -g "dosbox -conf "dosboxPGOLD.conf" -conf "dosboxPGOLD_single.conf" -no-console -c exit"
