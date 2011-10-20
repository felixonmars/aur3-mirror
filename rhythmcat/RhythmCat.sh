#!/bin/bash
__init_plugins() {
  local _OLDPWD="$PWD"

  test -d /usr/share/RhythmCat/plugins/ || return
  cd /usr/share/RhythmCat/plugins/ || return

  test -d "$HOME/.RhythmCat/Plugins/" || mkdir -p "$HOME/.RhythmCat/Plugins/"

  local i
  for i in *; do
    if [ -d "/usr/share/RhythmCat/plugins/$i" ] \
    && [ ! -L "$HOME/.RhythmCat/Plugins/$i" ]
    then
        test -e "$HOME/.RhythmCat/Plugins/$i" && rm -rf "$HOME/.RhythmCat/Plugins/$i"
        ln -sf "/usr/share/RhythmCat/plugins/$i" "$HOME/.RhythmCat/Plugins/"
    fi
  done

  cd "$_OLDPWD"
}

__init_plugins

exec /usr/lib/RhythmCat/RhythmCat "$@"
