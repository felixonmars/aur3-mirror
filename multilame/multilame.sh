#!/bin/bash
# this script inspired from the one at http://www.vidarholen.net/contents/blog/?p=9

. /etc/multilame.conf

encode() {
. /etc/multilame.conf
for file; do
fileout=$(echo "$file" | sed s'/.wav//')
lame "$switches" "$file" "$fileout".mp3; done
}

export -f encode
find . -name '*.wav' -print0 | xargs -0 -n 1 -P $cores bash -c 'encode "$@"' --
