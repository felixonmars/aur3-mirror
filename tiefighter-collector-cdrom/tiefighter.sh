#! /bin/bash

if [ ! -f "/usr/lib/libtiefighter.sh" ]; then
  echo "Can't load /usr/lib/libtiefighter.sh" >&2
  exit 1
else
  . "/usr/lib/libtiefighter.sh"
fi

readonly SCRIPT_NAME="${0}"

tiefighter.script.game() {
  local batchScript='
    mount -u c
    mount c "'"${APP_DIR}"'"
    mount -u d
    mount d "'"${APP_DISK}"'" -t cdrom
  '
  if tiefighter.firstRun; then
    batchScript+='
      c:
      cd \
      imuse.exe
    '
  fi
  batchScript+="
    d:
    cd \\
    tie.exe $@
    exit
  "

  SDL_VIDEO_X11_WMCLASS=$(basename "${SCRIPT_NAME%.*}") dosbox -conf "${DOSBOX_CONF}" -exit -c "${batchScript}"
}

tiefighter.run tiefighter.script.game "$@"
