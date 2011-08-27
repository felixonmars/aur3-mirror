#!/bin/sh

post_install() {
cat << EOF
PLEASE NOTE:
------------------------------------------------------------------------
You can now configure your netcfg2 profiles exactly as in examples and
documentation, but replacing "wireless" by "wirelessral", as below:

  CONNECTION="wirelessral"

------------------------------------------------------------------------
EOF
}

op=$1
shift
[ "$(type -t "$op")" = "function" ] && $op "$@"
