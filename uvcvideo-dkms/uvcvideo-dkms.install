#!/bin/sh
post_install() {
    dkms add uvcvideo/${1%-*}
    cat << EOF
==> To build and install your modules run:
    dkms install uvcvideo/${1%-*}
==> To do this automatically at startup run:
    systemctl enable dkms.service
==> To install modules for all kernels execute shell script:
    for f in /lib/modules/[0-9]*; do dkms install uvcvideo/${1%-*} -k \$(basename \$f); done
EOF
}

pre_remove() {
    dkms remove -m uvcvideo/${1%-*} --all
}
