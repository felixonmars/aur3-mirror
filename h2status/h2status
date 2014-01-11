#!/bin/bash

function status { :; }

function on_event { :; }

function transform { cat; }

function entry {
  echo -ne '{"name":"'$1'","full_text":"'$2'"'${3:+,$3}'},'
}

function cached_status {
  local file=$tmp$1 interval=$2 command=$3
  read_status $1
  [[ -f $file ]] && (( $(date +%s) - $(stat -c %Y $file) < $interval )) && return
  touch $file
  { write_status $1 "$(eval $command)"; } >/dev/null &
}

function read_status {
  [[ -f $tmp$1 ]] && flock -s ${tmp}lock -c "cat $tmp$1"
}

function write_status {
  flock ${tmp}lock -c "echo '$2' > $tmp$1"
  update
}

function update {
  killall -USR1 i3status
}

function event_loop {
  while read line
  do
    eval $(echo "$line" | sed -re 's/^,|\{|\}|"//g' -e 'y/,:/;=/')
    on_event > /dev/null
  done
}

function status_loop {
  read; read; echo -e '{"version":1,"click_events":true}\n['
  while read line
  do
    echo "$line" | sed -r 's/^(,?\[)\{/\1'"$(status)"'{/' | transform
  done
}

tmp=/tmp/h2status_
[[ $1 == "update" && ! $2 ]] && { update; exit 0; }
[[ $1 == "write" && $2 && $3 && ! $4 ]] && { write_status $2 "$3"; exit 0; }
[[ $* ]] && { echo "Usage: h2status [update|write <module> <value>]"; exit 1; }
. ~/.h2statusrc
trap 'rm -f $tmp*; exit' EXIT INT TERM HUP
rm -f $tmp*
i3status | status_loop &
event_loop
