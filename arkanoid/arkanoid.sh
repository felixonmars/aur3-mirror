#! /bin/bash

if [ ! -f "/usr/lib/libarkanoid.sh" ]; then
  echo "Can't load /usr/lib/libarkanoid.sh" >&2
  exit 1
else
  . "/usr/lib/libarkanoid.sh"
fi

readonly SCRIPT_NAME="${0}"

arkanoid.script.game() {
  local batchScript="
    mount -u c
    mount c \"${APP_DIR}\"
    c:
    cd \\
    arkanoid.com $@
    exit
  "

  SDL_VIDEO_X11_WMCLASS=$(basename "${SCRIPT_NAME%.*}") dosbox -conf "${DOSBOX_CONF}" -exit -c "${batchScript}"
}

arkanoid.run arkanoid.script.game "$@"
