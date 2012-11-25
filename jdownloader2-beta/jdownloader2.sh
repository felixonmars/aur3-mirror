#!/usr/bin/env bash
#
# Copyright (C) 2009-2012 Benjamin Drung <bdrung at ubuntu dot com>
# Copyright (C) 2012 Alessio Sergi <al3hex at gmail dot com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.

set -e

JD_DIRECTORY="$HOME"/.jdownloader2
LOG_FILE="$JD_DIRECTORY"/jdownloader2.log
JAVA_OPTIONS="-Xmx512m"

notify() {
  local title="$1"
  local message="$2"

  if [ $(which notify-send 2>/dev/null) ]; then
    notify-send "$title" "$message"
  elif [ $(which kdialog 2>/dev/null) ]; then
    kdialog --title "$title" --passivepopup "$message"
  else
    echo -e "$0: [$title] $message" >&2
  fi
}

download_updater() {
  rm -f Updater.jar
  echo "$0: Download Updater.jar" >> "$LOG_FILE"
  curl -vLo - "http://bit.ly/HF8DI8" | bsdtar -xf - >> "$LOG_FILE" 2>&1 || notify "Error" \
    "The JDownloader updater could not be downloaded. \
    \nCheck your Internet connection and try again. \
    \nThe error log can be found in $LOG_FILE."

  ACTUAL_SHA256SUM=$(sha256sum Updater.jar | cut -f1 -d" ")
  TARGET_SHA256SUM=$(curl -sLI http://bit.ly/HF8DI8 | sed -n 's/CLIENT_UDPATE_HASH:\ //p')
  [[ "$ACTUAL_SHA256SUM" = "$TARGET_SHA256SUM" ]] || notify "Warning" \
    "The SHA-256 sum of the JDownloader updater mismatches. \
    \nEither there was a download error or one of the files \
    (downloader or md5 sum file) is not up-to-date. \
    \nThe log file can be found in $LOG_FILE."
}

usage() {
  cat <<EOF
Usage: ${0##*/} [option]

Options:
  -h                Show this help message and exit
  -r <directory>    The JDownloader directory to use
  -u                Manually check for updates
EOF
}

while getopts ':hr:u' opt; do
  case "$opt" in
    h) usage; exit 0 ;;
    r) JD_DIRECTORY="$OPTARG" ;;
    u) update=1 ;;
    :) echo "$0: Option '-$OPTARG' requires an argument" >&2
       exit 1 ;;
    *) echo "$0: Invalid option '-$OPTARG'" >&2
       usage; exit 1 ;;
  esac
done

# create JDownloader directory, if it is missing (e.g. first run)
[[ ! -d "$JD_DIRECTORY" ]] && mkdir -p "$JD_DIRECTORY"
cd "$JD_DIRECTORY"

# clear log
> "$LOG_FILE"

# download updater, if it is missing (e.g. first run)
if [[ ! -f Updater.jar ]]; then
  echo "$0: No installer/updater found in $JD_DIRECTORY." >> "$LOG_FILE"
  download_updater
fi

# start update if requested
if [[ "$update" = "1" ]]; then
  echo "$0: Starting updater by your request." >> "$LOG_FILE"
  exec java "$JAVA_OPTIONS" -jar Updater.jar
elif [[ -f JDownloader.jar ]]; then
  echo "$0: Starting JDownloader." >> "$LOG_FILE"
  exec java "$JAVA_OPTIONS" -jar JDownloader.jar $*
else
  # run updater, if JDownloader.jar does not exist
  echo "$0: No valid JDownloader.jar exist. Starting updater." >> "$LOG_FILE"
  exec java "$JAVA_OPTIONS" -jar Updater.jar
fi
