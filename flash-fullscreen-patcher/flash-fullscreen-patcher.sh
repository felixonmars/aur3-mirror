#!/bin/bash
MSPROG=/usr/share/flash-fullscreen-patcher/flash-fullscreen-patcher.exe

# remove 'press ESC ... ' message
if [ "$1" = "-f" ]; then
  TARGET_FILE="$2" # $(/usr/bin/realpath -e "$2")
  if [ -w "$TARGET_FILE" ]; then
    /usr/bin/wine $MSPROG -f "$TARGET_FILE" >/dev/null 2>&1
    case $? in
    0) echo "Patch Successful" ;;
    1) echo "Invalid Parameter" ;;
    2) echo "File Not Found" ;;
    3) echo "File Already Patched" ;;
    4) echo "Reboot Required" ;;
    5) echo "Incompatible or Unknown file" ;;
    esac
    echo -e "\nYou might also want to remove it for HTML5 videos in Firefox:\nGo to about:config and set 'full-screen-api.approval-required=false'"
  else
    echo "File not writable: $TARGET_FILE"
  fi
  exit
fi
# In multi monitor setups, don't leave full screen with mouse clicks in other monitor
if [ "$1" = "-i" ]; then
  TARGET_FILE="$2"
  if grep -qa _NET_ACTIVE_WINDOW "$TARGET_FILE"; then
    sed 's/_NET_ACTIVE_WINDOW/_NXT_ACTIVE_WINDOW/' -i "$TARGET_FILE" 
    echo "File: $TARGET_FILE patched."
  else
    echo "File: $TARGET_FILE already patched."
  fi
  exit
fi

# use gui mode
if [ "$1" = "-g" ]; then

echo "Copy libflashplayer.so, eg /usr/lib/mozilla/plugins/libflashplayer.so to a user writable location first, eg. ~/
Then use 'other' from the menu, enable any files and choose your copy as target.
After sucessful patching, copy it back as root."

echo -e "\nYou might also want to suppress 'Esc...' for HTML5 videos in Firefox:\nGo to about:config and set 'full-screen-api.approval-required=false'"

exec /usr/bin/wine $MSPROG
fi

echo -e "Usage: $0\n -g -- gui mode\n -f <file> -- remove ESC message\n -i <file> -- ignore mouse clicks in other monitor in multi monitor setups"
