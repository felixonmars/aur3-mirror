#! /bin/bash

if [ ! -f "/usr/lib/libx-wing.sh" ]; then
  echo "Can't load /usr/lib/libx-wing.sh" >&2
  exit 1
else
  . "/usr/lib/libx-wing.sh"
fi

readonly SCRIPT_NAME="${0}"

x-wing.script.game() {
  local batchScript='
    mount -u c
    mount c "'"${APP_DIR}"'"
    mount -u d
    mount d "'"${APP_DISK}"'" -t cdrom
    c:
    cd \
  '
  if x-wing.firstRun; then
    batchScript+='
      install.exe
    '
  fi
  batchScript+="
    bwing.exe $@
    exit
  "

  SDL_VIDEO_X11_WMCLASS=$(basename "${SCRIPT_NAME%.*}") dosbox -conf "${DOSBOX_CONF}" -exit -c "${batchScript}"
}

x-wing.run x-wing.script.game "$@"
