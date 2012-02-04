#!/bin/sh
# $Id$
# vim:set ts=2 sw=2 et:

# arg 1:  the new package version
pre_install() {
 /bin/true
}

# arg 1:  the new package version
post_install() {
  echo ">>> Creating gitauth user and group and setting permissions..."
  getent group git > /dev/null || usr/sbin/groupadd git &> /dev/null
  getent passwd git > /dev/null || usr/sbin/useradd --shell /bin/bash -g git --home '/opt/gitauth' --system  --comment 'Git Auth User' git &> /dev/null

  chown -R git:git /opt/gitauth
  chmod -R 775 /opt/gitauth

  echo ">>> To install gitauth, please run"
  echo ">>> sudo -H -u git -i /opt/gitauth/bin/gitauth install"

  cat << EOF
>>>
EOF
}

# arg 1:  the new package version
# arg 2:  the old package version
pre_upgrade() {
 /bin/true
}

# arg 1:  the new package version
# arg 2:  the old package version
post_upgrade() {
  post_install $1
}

# arg 1:  the old package version
pre_remove() {
  usr/sbin/userdel git &>/dev/null
  usr/sbin/groupdel git &>/dev/null
}

# arg 1:  the old package version
post_remove() {
 /bin/true
}

