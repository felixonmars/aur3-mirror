#!/bin/sh
# $Id$
# vim:set ts=2 sw=2 et:

# arg 1:  the new package version
pre_install() {
 /bin/true
}

# arg 1:  the new package version
post_install() {
  ln -s /opt/jenkins-lts/bin/jenkins-lts /etc/rc.d/jenkins-lts
  
  echo ">>> Creating user and group and setting permissions..."
  getent group jenkins-lts > /dev/null || usr/sbin/groupadd jenkins-lts
  getent passwd jenkins-lts > /dev/null || usr/sbin/useradd -c \
       'Jenkins CI' -g jenkins-lts -d '/var/lib/jenkins-lts' \
       --system -s /bin/bash jenkins-lts &> /dev/null

  cd /opt/jenkins-lts

  chown -R jenkins-lts:jenkins-lts /opt/jenkins-lts/tmp
  chown -R jenkins-lts:jenkins-lts /opt/jenkins-lts/logs
  chown -R jenkins-lts:jenkins-lts /opt/jenkins-lts
  chown -R jenkins-lts:jenkins-lts /var/lib/jenkins-lts
  chown -R jenkins-lts:jenkins-lts /var/run/jenkins-lts

  cat << EOF
>>>
>>> Jenkins can now be started via /opt/jenkins-lts/bin/jenkins-lts or via
>>> /etc/rc.d/jenkins-lts.  
>>> Jenkins is running by default on port 8070 and is bound to all interfaces,
>>> you can change this in the /opt/jenkins-lts/conf/wrapper.conf as well. 
>>> For additional information please visit http://jenkins-ci.org
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

  cd /opt/jenkins-lts

  chown -R jenkins-lts:jenkins-lts /opt/jenkins-lts/tmp
  chown -R jenkins-lts:jenkins-lts /opt/jenkins-lts/logs
  chown -R jenkins-lts:jenkins-lts /opt/jenkins-lts
  chown -R jenkins-lts:jenkins-lts /var/lib/jenkins-lts
  chown -R jenkins-lts:jenkins-lts /var/run/jenkins-lts

}

# arg 1:  the old package version
pre_remove() {
 /bin/true
}

# arg 1:  the old package version
post_remove() {

  getent passwd jenkins-lts > /dev/null && usr/sbin/userdel jenkins-lts &>/dev/null
  getent group jenkins-lts > /dev/null && usr/sbin/groupdel jenkins-lts &>/dev/null  

        if [ -d /var/run/jenkins-lts ] ; then
            rm -r /var/run/jenkins-lts
        fi  

#        if [ -d /var/lib/jenkins ] ; then
#            rm -r /var/lib/jenkins
#        fi  

        if [ -h /etc/rc.d/jenkins-lts ] ; then
            rm /etc/rc.d/jenkins-lts
        fi  
}
