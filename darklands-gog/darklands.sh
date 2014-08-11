#!/bin/bash

uname 002
cd "/opt/Darklands"
sg games -c "dosbox -conf "dosboxDarklands.conf" -conf "dosboxDarklands_single.conf" -no-console -c exit"
