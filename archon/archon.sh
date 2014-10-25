#!/usr/bin/env bash

# Show usage information if the user attempts to run without an Android APK as input
[[ ! -f "$1" ]] && echo "Usage: $(grep -o -e "[^\/]*$" <<< "$0") [APK]" && exit 1

# Allow the user to specify ARCHON_TMPDIR, otherwise use the default
[[ -z "$ARCHON_TMPDIR" ]] && ARCHON_TMPDIR='/tmp/archon'

# Store the md5sum of the APK so different versions won't overwrite eachother
SUM=$(md5sum "$1" | sed 's|\ .*||')

# If there isn't already an extracted copy of the APK, extract one using chromeos-apk now
if [ ! -d "${ARCHON_TMPDIR}/${SUM}" ]; then
    install -d "${ARCHON_TMPDIR}/${SUM}"
    ln -s $(readlink -f "$1") "${ARCHON_TMPDIR}/${SUM}/${1}"
    pushd "${ARCHON_TMPDIR}/${SUM}" >/dev/null 2>&1
    chromeos-apk --archon --tablet "$1" >chromeos-apk.log

    # Fix 'There is no "message" element for key extName' Error
    if [[ $(grep -r appNotSupported) ]]; then
        APKDIR=$(ls -1 --group-directories-first | head -n 1)
        EXTNAME=$(cat ${APKDIR}/manifest.json  | grep '"name":' | head -n 1 | sed 's|[^"]*"name"[^"]*"||;s|".*||')
        for msgfile in $(find ${APKDIR}/_locales -type f -name 'messages.json'); do
            echo -e '{\n  "extName": {\n    "description": "'$EXTNAME'",\n    "message": ""\n  }\n}' > "$msgfile"
        done
    fi
    popd >/dev/null 2>&1
fi

# Evaluate the name of the directory containing the app and produce an error if one can't be found
APPDIR=$(ls -1 -d --group-directories-first "${ARCHON_TMPDIR}/${SUM}"/* | head -n 1 | sed 's|^.*/||')
[[ ! -d "${ARCHON_TMPDIR}/${SUM}/${APPDIR}" ]] && echo "Error: no app directory in ${ARCHON_TMPDIR}/${SUM}, delete and run again" && exit 1

# Define the common part of the execution command used by both ARChon and the Android app
EXE="chromium --user-data-dir=${HOME}/.config/archon --profile-directory=$APPDIR --silent-launch"

# Start ARChon and the Android app
$EXE --load-and-launch-app=/usr/share/archon/ > /dev/null 2>&1 &
sleep 1
$EXE --load-and-launch-app="${ARCHON_TMPDIR}/${SUM}/${APPDIR}" > "${ARCHON_TMPDIR}/${SUM}/run.log" &
sleep 1

# Cleanup the non-functional XDG desktop file created by Chromium
rm -f ${HOME}/.local/share/applications/chrome-*-${APPDIR}.desktop

