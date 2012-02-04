#!/bin/bash
# Launcher script for iKog
# TDY <tdy@gmx.com>

LOCAL_DIR="$HOME"/.ikog
ORIG_DIR=/usr/share/ikog

# Create ikog.db if necessary
check_db() {
  local db="$LOCAL_DIR"/ikog.db
  local bak="$LOCAL_DIR"/ikog.db.bak
  local orig=$ORIG_DIR/ikog.py

  if [[ -f $db ]]; then
    echo " found $db"
  elif [[ -f $bak ]]; then
    echo " creating $db from $bak"
    install -Dm644 "$bak" "$db"
  elif [[ -f $orig ]]; then
    echo " creating $db from $orig"
    install -Dm644 $orig "$db"
  else
    echo -e " \033[1;31;40mno usable lists detected\033[1;0m"
    exit
  fi
}

# Create ikog.css if necessary
check_css() {
  local css="$LOCAL_DIR"/ikog.css
  local orig=$ORIG_DIR/ikog.css

  if [[ -f $css ]]; then
    echo " found $css"
  else
    echo " creating $css from $orig"
    install -Dm644 $orig "$css"
  fi
}

### Main ###

echo ":: iKog sanity checks..."
check_db
check_css

echo ":: Launching iKog..."
cd "$LOCAL_DIR"
python2 ikog.db "$@"
exit $?
