#! /bin/bash

if [ ! -f "/usr/lib/libascendancy.sh" ]; then
  echo "Can't load /usr/lib/libascendancy.sh" >&2
  exit 1
else
  . "/usr/lib/libascendancy.sh"
fi

readonly SCRIPT_NAME="${0}"

ascendancy.script.game() {
  local batchScript='
    mount -u c
    mount c "'"${APP_DIR}"'"
    c:
    cd \
  '
  if ascendancy.firstRun; then
    batchScript+='
      uvconfig.exe -gen
      setsound.exe
    '
  fi
  batchScript+="
    ascend.exe $@
    exit
  "

  SDL_VIDEO_X11_WMCLASS=$(basename "${SCRIPT_NAME%.*}") dosbox -conf "${DOSBOX_CONF}" -exit -c "${batchScript}"
}

ascendancy.run ascendancy.script.game "$@"
