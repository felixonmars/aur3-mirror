#!/bin/bash

umask 002
cd "/opt/Duke Nukem 3D"
sg games -c "dosbox -conf "dosboxDuke3D.conf"  -conf "dosboxDuke3D_editor.conf" -no-console -c exit"
