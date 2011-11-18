rebelassault.run() {
  local APP_NAME="rebelassault"
  local APP_DIR="${XDG_DATA_HOME}/${APP_NAME}"
  local APP_DISK="/usr/share/games/${APP_NAME}"
  local DOSBOX_CONF="${XDG_CONFIG_HOME}/${APP_NAME}/$(basename $(dosbox -printconf))"
  local __firstRun=false

  if [ ! -f "${DOSBOX_CONF}" ]; then
    install -Dm644 $(dosbox -printconf) "${DOSBOX_CONF}"
  fi

  if [ ! -d "${APP_DIR}" ]; then
    __firstRun=true
  fi

  mkdir -p "${APP_DIR}" &&
  cd "${APP_DIR}" &&
  "$@"
}

rebelassault.firstRun() {
  "${__firstRun}"
}
