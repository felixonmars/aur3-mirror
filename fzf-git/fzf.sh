# vimf - Open selected file in Vim
vimf() {
  FILE=$(fzf) && vim "$FILE"
}

# fd - cd to selected directory
fd() {
  DIR=$(find ${1:-*} -path '*/\.*' -prune -o -type d -print 2> /dev/null | fzf) && cd "$DIR"
}

# fda - including hidden directories
fda() {
  DIR=$(find ${1:-*} -type d 2> /dev/null | fzf) && cd "$DIR"
}

# fh - repeat history
fh() {
  eval $(history | fzf +s | sed 's/ *[0-9]* *//')
}

# fkill - kill process
fkill() {
  ps -ef | sed 1d | fzf | awk '{print $2}' | xargs kill -${1:-9}
}
