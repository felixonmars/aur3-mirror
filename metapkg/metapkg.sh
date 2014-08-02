#!/bin/bash

print-usage () {
  cat <<EOT
usage: $0 [COMMAND] [OPTIONS]

Commands:
  -C <name>  Create a PKGBUILD for package with given dependencies.
EOT
}

check-pkgname () {
  true
}

generate-pkgbuild () {
  local TargetFile="$1"
  local PkgName="$2"
  shift 2

  local PkgDeps=("$@")

  for Pkg in "$PkgName" "${PkgDeps[@]}"; do
    check-pkgname "$Pkg" 
  done 

  cat >"$TargetFile" <<EOF
pkgname=${PkgName}
pkgver=$(date +%Y%m%d.%H%M%S)
pkgrel=1
arch=(any)
depends=(${PkgDeps[@]})

package () {
  true
}
EOF
}


expand-groups () {
  for pkg in "$@"; do
    if ! pacman -Qqg $pkg 2>/dev/null; then
      echo $pkg
    fi
  done
}

# ================ #
# === COMMANDS === #

command-create () {
  generate-pkgbuild "$PACKAGE".PKGBUILD "$PACKAGE" $(expand-groups "$@")
}


# =================== #
# === MAIN SCRIPT === #

# Options
while getopts :C: OPT; do
  case $OPT in
    'C') COMMAND=create
         PACKAGE="$OPTARG"
    ;;

    '?') printf "Invalid option: -$OPTARG\n"
         print-usage
         exit 1
    ;;

    ':') printf "Option -$OPTARG needs an argument\n"
         print-usage
         exit 1
    ;;
  esac
done

# If no command was specified, print usage and exit
if [ -z "$COMMAND" ]; then
  print-usage
  exit 1
fi

shift $(($OPTIND - 1))
command-$COMMAND "$@"