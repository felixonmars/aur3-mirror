#!/bin/sh
# $Id$
# vim:set ts=2 sw=2 et:

# arg 1:  the new package version
pre_install() {
 /bin/true
}

# arg 1:  the new package version
post_install() {
  ln -s /opt/nexus/bin/nexus /etc/rc.d/nexus

  echo ">>> Creating user and group and setting permissions..."
  getent group nexus || usr/sbin/groupadd nexus
  getent passwd nexus  || usr/sbin/useradd -c \
        'Maven Repository Manager' -g nexus -d '/opt/nexus' \
        --system -s /bin/bash nexus &> /dev/null

  cd opt/nexus

  chown -R nexus:nexus * 
  chown -R nexus:nexus /opt/nexus 
  chown -R nexus:nexus /opt/nexus/run
  chown -R nexus:nexus /opt/nexus-*
  chown -R nexus:nexus /opt/sonatype-work
}

# arg 1:  the new package version
# arg 2:  the old package version
pre_upgrade() {
 /bin/true
}

# arg 1:  the new package version
# arg 2:  the old package version
post_upgrade() {
  cd opt/nexus

  chown -R nexus:nexus * 
  chown -R nexus:nexus /opt/nexus 
  chown -R nexus:nexus /opt/nexus/run
  chown -R nexus:nexus /opt/nexus-*
  chown -R nexus:nexus /opt/sonatype-work

}

# arg 1:  the old package version
pre_remove() {
 /bin/true
}

# arg 1:  the old package version
post_remove() {
  getent passwd nexus && usr/sbin/userdel nexus &>/dev/null
  getent group nexus && usr/sbin/groupdel nexus &>/dev/null  

  if [ -d /opt/nexus/run ] ; then
      rm -r /opt/nexus/run
  fi  

  if [ -h /etc/rc.d/nexus ] ; then
      rm /etc/rc.d/nexus
  fi  

}
