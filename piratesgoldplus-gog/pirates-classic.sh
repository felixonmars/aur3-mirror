#!/bin/bash

umask 002
cd "/opt/Pirates Gold Plus"
sg games -c "dosbox -conf "dosboxP.conf" -conf "dosboxP_single.conf" -no-console -c exit"
