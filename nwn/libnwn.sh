nwn.run() {
  local -r APP_NAME="nwn"
  local -r TMPDIR="${TMPDIR:-/tmp}"
  local RW_BRANCH="${RW_BRANCH:-${XDG_DATA_HOME}/${APP_NAME}}"
  local -r APP_DIR="${TMPDIR}/${APP_NAME}-tmp-${USER}"
  local -r CONF_DIR="/etc/${APP_NAME}"
  local -r BRANCHES_D="/etc/${APP_NAME}/branches.d"
  local __firstRun=false

  if [ ! -d "${RW_BRANCH}" ]; then
    __firstRun=true
  fi

  mkdir -p "${RW_BRANCH}" "${APP_DIR}" &&
  { findmnt "${APP_DIR}" || RW_BRANCH="${RW_BRANCH}" modfs -o cow -o "uid=${UID}" -o "gid=${GROUPS[0]}" "${BRANCHES_D}" "${APP_DIR}"; } &&
  cd "${APP_DIR}" &&
  "$@"

  cd / &&
  fusermount -u "${APP_DIR}" &&
  rmdir "${APP_DIR}"
}

nwn.exec() {
  local -r EXEC_NAME=$(basename "${1}")
  local -r EXEC_D="${CONF_DIR}/hooks.d"
  local -r EXEC_PREFIX="nwn.hooks.${EXEC_NAME}."
  if [ -d "${EXEC_D}" ]; then
    local f
    for f in "${EXEC_D}/"*.sh; do
      [ -f "${f}" ] && source "${f}"
    done
  fi
  local -a commandLine=($(compgen -A function "${EXEC_PREFIX}") "${@}")
  "${commandLine[@]}"
}

nwn.firstRun() {
  "${__firstRun}"
}
