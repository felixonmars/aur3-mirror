#!/usr/bin/env bash

[[ ! -f "$1" ]] && echo "Usage: $(grep -o -e "[^\/]*$" <<< "$0") [APK]" && exit 1

TMP='/tmp/archon'
SUM=$(md5sum "$1" | sed 's|\ .*||')

if [ ! -d "${TMP}/${SUM}" ]; then
    install -d "${TMP}/${SUM}"
    ln -s $(readlink -f "$1") "${TMP}/${SUM}/${1}"
    pushd "${TMP}/${SUM}" >/dev/null 2>&1
    chromeos-apk --archon --tablet "$1" >chromeos-apk.log
    popd >/dev/null 2>&1
fi

APPDIR=$(ls -1 -d --group-directories-first "${TMP}/${SUM}"/* | head -n 1 | sed 's|^.*/||')
[[ ! -d "${TMP}/${SUM}/${APPDIR}" ]] && echo "Error: no app directory in ${TMP}/${SUM}, delete and run again" && exit 1

EXE="chromium --user-data-dir=${HOME}/.config/archon --profile-directory=${APPDIR} --silent-launch"

$EXE --load-and-launch-app=/usr/share/archon/ >/dev/null 2>&1 &
sleep 1

$EXE --load-and-launch-app="${TMP}/${SUM}/${APPDIR}" >"${TMP}/${SUM}/run.log"
