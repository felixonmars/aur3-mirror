#!/usr/bin/env bash

# Show usage information if the user attempts to run without an Android APK as input
[[ ! -f "$1" ]] && {
    echo "Usage: $(grep -o -e "[^\/]*$" <<< "$0") [APK]"
    exit 1
}

# Allow the user to specify ARCHON_TMPDIR, otherwise use the default
[[ -z "$ARCHON_TMPDIR" ]] && ARCHON_TMPDIR='/tmp/archon'

# Store the md5sum of the APK so different versions won't overwrite eachother
SUM=$(md5sum "$1" | sed 's|\ .*||')

# Delete the existing apk directory if it doesn't contain exactly one folder
[[ -d "$ARCHON_TMPDIR/$SUM" ]] \
    && [[ ! $(find "$ARCHON_TMPDIR/$SUM" -maxdepth 1 -mindepth 1 -type d | wc -l) = 1 ]] \
    && rm -rf "$ARCHON_TMPDIR/$SUM"

# If an app directory doesn't exist, create one and extract the APK using chromeos-apk
[[ ! -d "$ARCHON_TMPDIR/$SUM" ]] && {
    install -d "$ARCHON_TMPDIR/$SUM"
    ln -s $(readlink -f "$1") "$ARCHON_TMPDIR/$SUM/$1"

    pushd "$ARCHON_TMPDIR/$SUM" >/dev/null
    chromeos-apk --archon --tablet "$1" >chromeos-apk.log
    # Fix the "There is no message element for key extName" error
    [[ $(grep -r 'appNotSupported') ]] && {
        APKDIR=$(ls -1 --group-directories-first | head -n 1)
        EXTNAME=$(cat "$APKDIR/manifest.json" \
            | grep '"name":' \
            | head -n 1 \
            | sed 's|[^"]*"name"[^"]*"||;s|".*||')

        for msgfile in $(find "$APKDIR/_locales" -type f -name 'messages.json'); do
            echo -e '{\n  "extName": {\n    "description": "'"$EXTNAME"'",\n    "message": ""\n  }\n}' \
                > "$msgfile"
        done
    }
    popd >/dev/null
}

# Evaluate the name of the directory containing the app and produce an error if one can't be found
APPDIR=$(find "$ARCHON_TMPDIR/$SUM" -maxdepth 1 -mindepth 1 -type d | sed 's|^.*/||')

# Remove the apk folder and exit with an error if the app directory wasn't created
[[ -z "$APPDIR" ]] && {
    echo 'Error: chromeos-apk failed to extract an app folder in "'"$ARCHON_TMPDIR/$SUM"'"'
    [[ -d "$ARCHON_TMPDIR/$SUM" ]] && rm -rf "$ARCHON_TMPDIR/$SUM"
    exit 1
}

# Define the common part of the execution command used by both ARChon and the Android app
EXE='chromium --user-data-dir='"$HOME"'/.config/archon --profile-directory='"$APPDIR"' --silent-launch'

# Start ARChon
$EXE --load-and-launch-app=/usr/share/archon/ > /dev/null 2>&1 &
sleep 1

# Launch the Android app
$EXE --load-and-launch-app="$ARCHON_TMPDIR/$SUM/$APPDIR" > "$ARCHON_TMPDIR/$SUM/run.log" &
sleep 1

# Cleanup the non-functional XDG desktop file created by Chromium
XDGDESKTOP=$(ls "$HOME/.local/share/applications" | egrep 'chrome-.*-'"$APPDIR"'\.desktop')
[[ -n "$XDGDESKTOP" ]] \
    && rm "$HOME/.local/share/applications/$XDGDESKTOP"

exit 0
