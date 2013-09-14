#!/bin/sh

post_install() {
  dkms add broadcom-sta-dkms/${1} >/dev/null
  cat << EOF
==> To build and install your modules run: dkms install broadcom-sta-dkms/${1}
==> To do this automatically at startup run: systemctl enable dkms.service
EOF
}

pre_upgrade() {
  pre_remove "$2"
}

post_upgrade() {
  post_install "$1"
}

pre_remove() {
  [ -n "${1}" ] && dkms remove broadcom-sta-dkms/${1} --all >/dev/null || true
}
