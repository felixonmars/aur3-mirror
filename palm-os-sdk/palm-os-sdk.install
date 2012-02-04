#!/bin/sh

post_install() {
cat << EOF

If you are planning to use PRC-Tools (AUR package prc-tools-bin) with the SDK,
you need to run the following at the command line as the root user:
    # palmdev-prep
This makes PRC-Tools look for the SDK files and cache their location.
EOF
}

post_upgrade() {
  post_install
}
