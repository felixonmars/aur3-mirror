# Auto-completion
# ---------------
[[ $- =~ i ]] && source /usr/share/bash-completion/completions/fzf

# Key bindings
# ------------
#
# adapted from junegunn/fzf/install
# assumes /etc/profile.d/fzf.sh is sourced from bash config
#
__fsel() {
  command find * -path '*/\.*' -prune \
    -o -type f -print \
    -o -type d -print \
    -o -type l -print 2> /dev/null | fzf -m | while read item; do
    printf '%q ' "$item"
  done
  echo
}

if [[ $- =~ i ]]; then

__fsel_tmux() {
  local height
  height=${FZF_TMUX_HEIGHT:-40%}
  if [[ $height =~ %$ ]]; then
    height="-p ${height%\%}"
  else
    height="-l $height"
  fi
  tmux split-window $height "bash -c 'tmux send-keys -t $TMUX_PANE \"\$(__fsel)\"'"
}

__fcd() {
  local dir
  dir=$(command find -L ${1:-*} -path '*/\.*' -prune -o -type d -print 2> /dev/null | fzf +m) && printf 'cd %q' "$dir"
}

__use_tmux=0
[ -n "$TMUX_PANE" -a ${FZF_TMUX:-1} -ne 0 -a ${LINES:-40} -gt 15 ] && __use_tmux=1

if [ -z "$(set -o | grep '^vi.*on')" ]; then
  # Required to refresh the prompt after fzf
  bind '"\er": redraw-current-line'

  # CTRL-T - Paste the selected file path into the command line
  if [ $__use_tmux -eq 1 ]; then
    bind '"\C-t": " \C-u \C-a\C-k$(__fsel_tmux)\e\C-e\C-y\C-a\C-d\C-y\ey\C-h"'
  else
    bind '"\C-t": " \C-u \C-a\C-k$(__fsel)\e\C-e\C-y\C-a\C-y\ey\C-h\C-e\er \C-h"'
  fi

  # CTRL-R - Paste the selected command from history into the command line
  bind '"\C-r": " \C-e\C-u$(HISTTIMEFORMAT= history | fzf +s +m -n2..,.. | sed \"s/ *[0-9]* *//\")\e\C-e\er"'

  # ALT-C - cd into the selected directory
  bind '"\ec": " \C-e\C-u$(__fcd)\e\C-e\er\C-m"'
else
  bind '"\C-x\C-e": shell-expand-line'
  bind '"\C-x\C-r": redraw-current-line'

  # CTRL-T - Paste the selected file path into the command line
  # - FIXME: Selected items are attached to the end regardless of cursor position
  if [ $__use_tmux -eq 1 ]; then
    bind '"\C-t": "\e$a \eddi$(__fsel_tmux)\C-x\C-e\e0P$xa"'
  else
    bind '"\C-t": "\e$a \eddi$(__fsel)\C-x\C-e\e0Px$a \C-x\C-r\exa "'
  fi
  bind -m vi-command '"\C-t": "i\C-t"'

  # CTRL-R - Paste the selected command from history into the command line
  bind '"\C-r": "\eddi$(HISTTIMEFORMAT= history | fzf +s +m -n2..,.. | sed \"s/ *[0-9]* *//\")\C-x\C-e\e$a\C-x\C-r"'
  bind -m vi-command '"\C-r": "i\C-r"'

  # ALT-C - cd into the selected directory
  bind '"\ec": "\eddi$(__fcd)\C-x\C-e\C-x\C-r\C-m"'
  bind -m vi-command '"\ec": "i\ec"'
fi

unset __use_tmux

fi

# from fzf/wiki/examples

# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fe() {
  local file
  file=$(fzf --query="$1" --select-1 --exit-0)
  [ -n "$file" ] && ${EDITOR:-vim} "$file"
}

# Equivalent to above, but opens it with `xdg-open` command
fo() {
  local file
  file=$(fzf --query="$1" --select-1 --exit-0)
  [ -n "$file" ] && xdg-open "$file"
}

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-*} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# fda - including hidden directories
fda() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
}

# cdf - cd into the directory of the selected file
cdf() {
   local file
   local dir
   file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}

# utility function used to write the command in the shell
writecmd() {
  perl -e '$TIOCSTI = 0x5412; $l = <STDIN>; $lc = $ARGV[0] eq "-run" ? "\n" : ""; $l =~ s/\s*$/$lc/; map { ioctl STDOUT, $TIOCSTI, $_; } split "", $l;' -- $1
}

# fh - repeat history
fh() {
  ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s | sed -re 's/^\s*[0-9]+\s*//' | writecmd -run
}

# fhe - repeat history edit
fhe() {
  ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s | sed -re 's/^\s*[0-9]+\s*//' | writecmd
}

# fkill - kill process
fkill() {
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    kill -${1:-9} $pid
  fi
}

# fbr - checkout git branch
fbr() {
  local branches branch
  branches=$(git branch) &&
  branch=$(echo "$branches" | fzf +s +m) &&
  git checkout $(echo "$branch" | sed "s/.* //")
}

# fco - checkout git commit
fco() {
  local commits commit
  commits=$(git log --pretty=oneline --abbrev-commit --reverse) &&
  commit=$(echo "$commits" | fzf +s +m -e) &&
  git checkout $(echo "$commit" | sed "s/ .*//")
}

# ftags - search ctags
ftags() {
  local line
  [ -e tags ] &&
  line=$(
    awk 'BEGIN { FS="\t" } !/^!/ {print toupper($4)"\t"$1"\t"$2"\t"$3}' tags |
    cut -c1-80 | fzf --nth=1,2
  ) && $EDITOR $(cut -f3 <<< "$line") -c "set nocst" \
                                      -c "silent tag $(cut -f2 <<< "$line")"
}

# fs [FUZZY PATTERN] - Select selected tmux session
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fs() {
  local session
  session=$(tmux list-sessions -F "#{session_name}" | \
    fzf --query="$1" --select-1 --exit-0) &&
  tmux switch-client -t "$session"
}
