#! /bin/bash

if [ ! -f "/usr/lib/libsam1.sh" ]; then
  echo "Can't load /usr/lib/libsam1.sh" >&2
  exit 1
else
  . "/usr/lib/libsam1.sh"
fi

readonly SCRIPT_NAME="${0}"

sam1.script.game() {
  local batchScript="
    mount -u c
    mount c \"${APP_DIR}\"
    c:
    cd \\
    sam1.exe $@
    exit
  "

  SDL_VIDEO_X11_WMCLASS=$(basename "${SCRIPT_NAME%.*}") dosbox -conf "${DOSBOX_CONF}" -exit -c "${batchScript}"
}

sam1.run sam1.script.game "$@"
