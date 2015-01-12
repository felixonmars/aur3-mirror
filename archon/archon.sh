#!/usr/bin/env bash

#
# archon.sh: Wrapper script for launching APK files with ARChon and chromeos-apk
#
# Author: Kevin MacMartin
# Released under the MIT license
# Version: 1.0
#

# The directory to install APKs
[[ -z "$ARCHON_APKROOT" ]] && ARCHON_APKROOT='/tmp/archon'

# Don't allow variables set in the environment from here on out
set -o nounset

function create_apk_dir() {
    # Create and enter the folder to contain the extracted APK
    install -d "$ARCHON_APKROOT/$SUM"
    pushd "$ARCHON_APKROOT/$SUM" >/dev/null

    # Generate the APK folder using chromeos-apk
    chromeos-apk -a --tablet "$1" >chromeos-apk.log

    # Fix the "There is no message element for key extName" error
    [[ $(grep -r 'appNotSupported') ]] && {
        APPDIR=$(ls -1 --group-directories-first | head -n 1)
        EXTNAME=$(cat "$APPDIR/manifest.json" \
            | grep '"name":' \
            | head -n 1 \
            | sed 's|[^"]*"name"[^"]*"||;s|".*||')

        for msgfile in $(find "$APPDIR/_locales" -type f -name 'messages.json'); do
            echo -e '{\n  "extName": {\n    "description": "'"$EXTNAME"'",\n    "message": ""\n  }\n}' > "$msgfile"
        done
    }

    # Return to the original folder
    popd >/dev/null
}

# Show usage information if the user attempts to run without an Android APK as input
[[ ! -f "$1" ]] && {
    echo "Usage: $(grep -o -e "[^\/]*$" <<< "$0") [APK]"
    exit 1
}

# Store the md5sum of the APK so different versions won't overwrite eachother
SUM=$(md5sum "$1" | sed 's|\ .*||')

# Delete the existing apk directory if it doesn't contain exactly one folder
[[ -d "$ARCHON_APKROOT/$SUM" ]] \
    && [[ ! $(find "$ARCHON_APKROOT/$SUM" -maxdepth 1 -mindepth 1 -type d | wc -l) = 1 ]] \
        && rm -rf "$ARCHON_APKROOT/$SUM"

# If an app directory doesn't exist, create one and extract the APK using chromeos-apk
[[ ! -d "$ARCHON_APKROOT/$SUM" ]] && create_apk_dir "$(readlink -f "$1")"

# Evaluate the name of the directory containing the app
APPDIR=$(find "$ARCHON_APKROOT/$SUM" -maxdepth 1 -mindepth 1 -type d | sed 's|^.*/||')

# Remove the apk folder and exit with an error if an app directory doesn't exist
[[ -z "$APPDIR" ]] && {
    echo 'Error: chromeos-apk failed to extract an app folder in "'"$ARCHON_APKROOT/$SUM"'"'
    [[ -d "$ARCHON_APKROOT/$SUM" ]] && rm -rf "$ARCHON_APKROOT/$SUM"
    exit 1
}

# The common part of the Chromium launch command to launch the extracted APK using ARChon
EXE='chromium --user-data-dir='"$HOME"'/.config/archon --profile-directory='"$APPDIR"' --silent-launch'

# Start ARChon
$EXE --load-and-launch-app=/opt/archon/ > /dev/null 2>&1 &
sleep 1

# Launch the Android app
$EXE --load-and-launch-app="$ARCHON_APKROOT/$SUM/$APPDIR" > "$ARCHON_APKROOT/$SUM/run.log" &
sleep 1

# Cleanup the non-functional XDG desktop file created by Chromium
XDGDESKTOP=$(ls "$HOME/.local/share/applications" | egrep 'chrome-.*-'"$APPDIR"'\.desktop')
[[ -n "$XDGDESKTOP" ]] && rm "$HOME/.local/share/applications/$XDGDESKTOP"

exit 0
