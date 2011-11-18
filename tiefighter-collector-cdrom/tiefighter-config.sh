#! /bin/bash

if [ ! -f "/usr/lib/libtiefighter.sh" ]; then
  echo "Can't load /usr/lib/libtiefighter.sh" >&2
  exit 1
else
  . "/usr/lib/libtiefighter.sh"
fi

readonly SCRIPT_NAME="${0}"

tiefighter.script.config() {
  local batchScript="
    mount -u c
    mount c \"${APP_DIR}\"
    c:
    cd \\
    imuse.exe $@
    exit
  "
  SDL_VIDEO_X11_WMCLASS=$(basename "${SCRIPT_NAME%.*}") dosbox -conf "${DOSBOX_CONF}" -exit -c "${batchScript}"
}

tiefighter.run tiefighter.script.config "$@"
