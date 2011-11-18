#! /bin/bash

if [ ! -f "/usr/lib/libx-wing.sh" ]; then
  echo "Can't load /usr/lib/libx-wing.sh" >&2
  exit 1
else
  . "/usr/lib/libx-wing.sh"
fi

readonly SCRIPT_NAME="${0}"

x-wing.script.config() {
  local batchScript="
    mount -u c
    mount c \"${APP_DIR}\"
    c:
    cd \\
    install.exe $@
    exit
  "
  echo $(basename "${SCRIPT_NAME%.*}")
  SDL_VIDEO_X11_WMCLASS=$(basename "${SCRIPT_NAME%.*}") dosbox -conf "${DOSBOX_CONF}" -exit -c "${batchScript}"
}

x-wing.run x-wing.script.config "$@"
