#!/usr/bin/env sh

unzip $1 -d /opt/ut4

chgrp -R games /opt/ut4
chmod -R a+rw /opt/ut4/LinuxNoEditor/UnrealTournament/Saved

chmod +x /opt/ut4/LinuxNoEditor/Engine/Binaries/Linux/UE4
