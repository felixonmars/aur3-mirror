#!/bin/sh
pw=$(dd if=/dev/urandom count=50 2>/dev/null | md5sum | cut -d ' ' -f 1)
cat <<EOF | passwd --quiet root >/dev/null 2>/dev/null
$pw
$pw
EOF
unset pw
