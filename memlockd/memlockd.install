#!/bin/sh
# arg 1:  the new package version
post_install() {
  getent group memlockd >/dev/null ||
    groupadd --system memlockd

  getent passwd memlockd >/dev/null ||
    useradd --system \
            --gid memlockd \
            --shell /bin/false \
            --no-create-home \
            --home /usr/lib/memlockd \
            memlockd

  chown memlockd:memlockd /usr/lib/memlockd /etc/memlockd.d
}

# arg 1:  the old package version
pre_remove() {
  userdel memlockd &>/dev/null
  groupdel memlockd &>/dev/null
}
