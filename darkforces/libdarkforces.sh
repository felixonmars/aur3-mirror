darkforces.run() {
  local APP_NAME="darkforces"
  local TMPDIR="${TMPDIR:-/tmp}"
  local RW_BRANCH="${XDG_DATA_HOME}/${APP_NAME}"
  local APP_DIR="${TMPDIR}/${APP_NAME}-tmp-${USER}"
  local BRANCHES_D="/etc/${APP_NAME}.d"
  local DOSBOX_CONF="${XDG_CONFIG_HOME}/${APP_NAME}/$(basename $(dosbox -printconf))"
  local __firstRun=false

  if [ ! -f "${DOSBOX_CONF}" ]; then
    install -Dm644 $(dosbox -printconf) "${DOSBOX_CONF}"
  fi

  if [ ! -d "${RW_BRANCH}" ]; then
    __firstRun=true
  fi

  mkdir -p "${RW_BRANCH}" "${APP_DIR}" &&
  RW_BRANCH="${RW_BRANCH}" modfs -o cow -o "uid=${UID}" -o "gid=${GROUPS[0]}" "${BRANCHES_D}" "${APP_DIR}" &&
  cd "${APP_DIR}" &&
  "$@"

  cd / &&
  fusermount -u "${APP_DIR}" &&
  rmdir "${APP_DIR}"
}

darkforces.firstRun() {
  "${__firstRun}"
}
