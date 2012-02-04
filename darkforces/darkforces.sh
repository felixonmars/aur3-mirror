#! /bin/bash

if [ ! -f "/usr/lib/libdarkforces.sh" ]; then
  echo "Can't load /usr/lib/libdarkforces.sh" >&2
  exit 1
else
  . "/usr/lib/libdarkforces.sh"
fi

readonly SCRIPT_NAME="${0}"

darkforces.script.game() {
  local batchScript='
    mount -u c
    mount c "'"${APP_DIR}"'"
    c:
  '
  if darkforces.firstRun; then
    batchScript+='
      cd \
      rename cd.id cd.bak
      cd \dark
      install.exe
      cd \
      rename cd.bak cd.id
    '
  fi
  batchScript+="
    cd \\dark
    dark.exe $@
    exit
  "

  SDL_VIDEO_X11_WMCLASS=$(basename "${SCRIPT_NAME%.*}") dosbox -conf "${DOSBOX_CONF}" -exit -c "${batchScript}"
}

darkforces.run darkforces.script.game "$@"
