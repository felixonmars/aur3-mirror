#!/bin/sh
# $Id$
# vim:set ts=2 sw=2 et:

# arg 1:  the new package version
pre_install() {
 /bin/true
}

# arg 1:  the new package version
post_install() {
  ln -s /opt/jenkins/bin/jenkins /etc/rc.d/jenkins
  
  echo ">>> Creating user and group and setting permissions..."
  getent group jenkins > /dev/null || usr/sbin/groupadd jenkins
  getent passwd jenkins > /dev/null || usr/sbin/useradd -c \
       'Jenkins CI' -g jenkins -d '/var/lib/jenkins' \
       --system -s /bin/bash jenkins &> /dev/null

  cd /opt/jenkins

  chown -R jenkins:jenkins /opt/jenkins/tmp
  chown -R jenkins:jenkins /opt/jenkins/logs
  chown -R jenkins:jenkins /opt/jenkins
  chown -R jenkins:jenkins /var/lib/jenkins
  chown -R jenkins:jenkins /opt/jenkins/run

  cat << EOF
>>>
>>> Jenkins can now be started via /opt/jenkins/bin/jenkins or via
>>> /etc/rc.d/jenkins.  
>>> Jenkins is running by default on port 8070 and is bound to all interfaces,
>>> you can change this in the /opt/jenkins/conf/wrapper.conf as well. 
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

  cd /opt/jenkins

  chown -R jenkins:jenkins /opt/jenkins/tmp
  chown -R jenkins:jenkins /opt/jenkins/logs
  chown -R jenkins:jenkins /opt/jenkins
  chown -R jenkins:jenkins /var/lib/jenkins
  chown -R jenkins:jenkins /opt/jenkins/run

}

# arg 1:  the old package version
pre_remove() {
 /bin/true
}

# arg 1:  the old package version
post_remove() {

  getent passwd jenkins > /dev/null && usr/sbin/userdel jenkins &>/dev/null
  getent group jenkins > /dev/null && usr/sbin/groupdel jenkins &>/dev/null  

        if [ -d /opt/jenkins/run ] ; then
            rm -r /opt/jenkins/run
        fi  

#        if [ -d /var/lib/jenkins ] ; then
#            rm -r /var/lib/jenkins
#        fi  

        if [ -h /etc/rc.d/jenkins ] ; then
            rm /etc/rc.d/jenkins
        fi  
}
