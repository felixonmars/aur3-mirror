#! /bin/bash

if [ ! -f "/usr/lib/libcc1.sh" ]; then
  echo "Can't load /usr/lib/libcc1.sh" >&2
  exit 1
else
  . "/usr/lib/libcc1.sh"
fi

readonly SCRIPT_NAME="${0}"

cc1.script.game() {
  local batchScript="
    mount -u c
    mount c \"${APP_DIR}\"
    c:
    cd \\
    cc1.exe $@
    exit
  "

  SDL_VIDEO_X11_WMCLASS=$(basename "${SCRIPT_NAME%.*}") dosbox -conf "${DOSBOX_CONF}" -exit -c "${batchScript}"
}

cc1.run cc1.script.game "$@"
