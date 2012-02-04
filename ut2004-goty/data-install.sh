#!/bin/bash -e

export UT2004_PATH="/opt/ut2004"
    
if [ "$(whoami)" != "root" ]; then
    echo "Please run this script as root."
    exit 1
fi

UT2004_MOUNT=$(mount -l | grep '\[UT2004_DVD\]' | cut -d' ' -f3)

if [ -d "$UT2004_MOUNT" ]; then
  echo -e "\nUT2004-GOTY disc mountpoint auto-detected."
else
  echo -e "\nUnable to auto-detect disc.\nEnter the UT2004-GOTY disc mount location (i.e. /media/UT2004_DVD):"
  read UT2004_MOUNT
  if ! [ -d "$UT2004_MOUNT" ]; then
    echo "$UT2004_MOUNT does not exist."
    exit 1
  fi
fi

echo -e "\nCopying data files from disc..."
cp -nrv $UT2004_MOUNT/CD*/* "$UT2004_PATH/"

echo -e "\nExtracting data files to correct format..."
cd "$UT2004_PATH/System"
find "$UT2004_PATH" -iname *.uz2 -exec "$UT2004_PATH/System/ucc-bin" decompress "{}" -nohomedir \;

echo -e "\nCleaning up..."
cd "$UT2004_PATH"
find "$UT2004_PATH" -iname *.uz2 -delete
find "$UT2004_PATH" -iname *.exe -delete
rm -rf DirectX9
chmod -R 755 "$UT2004_PATH"

echo -e "\nPlease enter your UT2004 CD-Key (in the format XXXXX-XXXXX-XXXXX-XXXXX):"
read UT2004_KEY
echo "$UT2004_KEY" > "$UT2004_PATH/System/CDkey"

echo -e "\nDone!\n"
