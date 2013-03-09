#!/bin/bash

# License: Creative Commons Zero <https://creativecommons.org/publicdomain/zero/1.0/legalcode>

set -e -u

if [[ ! ( $# -eq 2 || $# -eq 3 && $3 =~ ^[0-9]+$ ) ]]; then
    echo "Usage: $0 <dictionary> <pattern> [max-hits]"
    exit 0
fi

DICTIONARY=$1
PATTERN=${2//\"/}
MAXHITS=${3-50}

eb() {
    local RESULT=$(mktemp) EB
    coproc EB { eblook "$DICTIONARY" >"$RESULT"; }

    printf \
'list
select 1
set max-hits %s
%s
set prompt "$$$$"
%s
quit
' "$MAXHITS" "$1" "$2" >&${EB[1]}
    wait

    while IFS=$'\n' read -r LINE; do
        if printf '%s\n' "$LINE" | iconv -f utf8 &>/dev/null; then
            printf '%s\n' "$LINE"
        else
            printf '%s\n' "$LINE" | \
                LC_ALL=C sed '
's/^$'\xAD\xA1'/$'\xa1\xca\xa3\xb1\xa1\xcb'/\;'
's/^$'\xAD\xA2'/$'\xa1\xca\xa3\xb2\xa1\xcb'/\;'
's/^$'\xAD\xA3'/$'\xa1\xca\xa3\xb3\xa1\xcb'/\;'
's/^$'\xAD\xA4'/$'\xa1\xca\xa3\xb4\xa1\xcb'/\;'
's/^$'\xAD\xA5'/$'\xa1\xca\xa3\xb5\xa1\xcb'/\;'
's/^$'\xAD\xA6'/$'\xa1\xca\xa3\xb6\xa1\xcb'/\;'
's/^$'\xAD\xA7'/$'\xa1\xca\xa3\xb7\xa1\xcb'/\;'
's/^$'\xAD\xA8'/$'\xa1\xca\xa3\xb8\xa1\xcb'/\;'
's/^$'\xAD\xA9'/$'\xa1\xca\xa3\xb9\xa1\xcb'/\;'
'                   | iconv -f eucjp -c
        fi
    done < <(grep -F -m 1 -A $MAXHITS '$$$$' "$RESULT" | \
        sed '
1s/^\(eblook> \)*\$\$\$\$\(\$\$\$\$\)\?//; # remove the prompt
s/<reference>/    /;
s/<\/reference=[^>]\+>//;
s/^<\(prev\|next\)>.*//;
s/<more[^>]*>/ (...)/;
s/<[^>]*>//g;
s/^ *[0-9]\+\. \([0-9:]\+\t\)/\1/;	
' | grep .)
    rm "$RESULT"
}

if [[ $# -eq 3 || $PATTERN =~ \* ]]; then
    eb "" "search \"$PATTERN\""
    exit 0
fi

MAXHITS=512

if [[ $PATTERN =~ ^[0-9:]+$ ]]; then
    RESULT=$(eb "" "content $PATTERN")
    NO_RESULT='No search has been executed yet.'
else
    RESULT=$(eb "search \"$PATTERN\"" "content 1")
    NO_RESULT='Too big: 1'
fi

if [[ $RESULT = $NO_RESULT ]]; then
    echo 'No result.'
else
    printf '%s\n' "$RESULT"
fi

exit 0
