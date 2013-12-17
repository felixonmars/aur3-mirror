#! /bin/bash

echo "
Copy libflashplayer.so, eg /usr/lib/mozilla/plugins/libflashplayer.so 
to a user writable location first, eg. ~/
Then use 'other' from the menu, enable any files and choose your copy as target.
After sucessful patching, copy it back as root.
"

exec /usr/bin/wine "/usr/share/flash-fullscreen-patcher/Flash Fullscreen Patcher.exe"
