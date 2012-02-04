#!/bin/bash
#
# A personal lbr dir can be set via $1 (defaults to $HOME/eagle/lbr if not set)
#

readonly VER=@VERSION@
readonly REL=@RELEASE@

LOCAL_DIR="$HOME"/.eagle
PROJ_DIR="$HOME"/eagle
EAGLE_DIR=/opt/eagle-$VER

LOCAL_LBR="${1:-$PROJ_DIR/lbr}"
if [[ -n $1 ]] || (! grep "^Directories\.Lbr[^=]*=" "$HOME"/.eaglerc &> /dev/null); then
  echo "Directories.Lbr = \"$LOCAL_LBR\"" >> "$HOME"/.eaglerc
fi

create_local() {
  rm -rf "$LOCAL_DIR"
  install -dm755 "$LOCAL_DIR"
  cp -r "$EAGLE_DIR"/* "$LOCAL_DIR"
  touch "$LOCAL_DIR"/.eagle-$VER-$REL
}

[[ ! -e "$LOCAL_DIR"/.eagle-$VER-$REL ]] && create_local
[[ ! -d "$LOCAL_LBR" ]] && install -dm755 "$LOCAL_LBR"
[[ ! -d "$PROJ_DIR" ]] && install -dm755 "$PROJ_DIR"

cd "$LOCAL_DIR"/bin
exec ./eagle
