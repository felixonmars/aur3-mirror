#! /bin/bash

if [ ! -f "/usr/lib/librebelassault2.sh" ]; then
  echo "Can't load /usr/lib/librebelassault2.sh" >&2
  exit 1
else
  . "/usr/lib/librebelassault2.sh"
fi

readonly SCRIPT_NAME="${0}"

rebelassault2.script.game() {
  local batchScript="
    mount -u c
    mount c \"${APP_DIR}\"
    mount -u d
    mount d \"${APP_DISK}\" -t cdrom
    d:
    cd \\
    rebel2.exe C: $@
    exit
  "

  SDL_VIDEO_X11_WMCLASS=$(basename "${SCRIPT_NAME%.*}") dosbox -conf "${DOSBOX_CONF}" -exit -c "${batchScript}"
}

rebelassault2.run rebelassault2.script.game "$@"
