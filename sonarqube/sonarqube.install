#!/bin/sh
# $Id$
# vim:set ts=2 sw=2 et:

# arg 1:  the new package version
pre_install() {
 /bin/true
}

# arg 1:  the new package version
post_install() {
  echo ">>> Creating user and group and setting permissions..."
  getent group sonar > /dev/null || usr/sbin/groupadd sonar
  getent passwd sonar > /dev/null || usr/sbin/useradd -c \
        'Sonar Code Quality metric system' -g sonar -d '/opt/sonarqube' \
        --system -s /bin/bash sonar &> /dev/null

  cd opt/sonarqube

  chown -R sonar:sonar * 
  chown -R sonar:sonar /opt/sonarqube/run
  chown -R sonar:sonar /var/log/sonarqube

  cat << EOF
>>>
>>> Sonar can now be started via /opt/sonarqube/bin/sonar.sh or via
>>> systemctl start sonarqube. 
>>> 
>>> Sonar will run by default using the Derby embedded database, to change this
>>> to another database (e.g. MySql), please edit the 
>>> /opt/sonarqube/conf/sonar.properties accordingly.
>>>  
>>> Sonar is running by default on port 9000 and is bound to all interfaces,
>>> you can change this in the file /opt/sonarqube/conf/sonar.properties. 
>>>
>>> For additional information please visit http://sonar.codehaus.org
>>> 
>>> If you are upgrading from an earlier version, please read http://sonar.codehaus.org/
>>> and browse to http://localhost:9000/setup.
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
  cd opt/sonarqube

  chown -R sonar:sonar * 
  chown -R sonar:sonar /opt/sonarqube/run
  chown -R sonar:sonar /var/log/sonarqube
}

# arg 1:  the old package version
pre_remove() {
 /bin/true
}

# arg 1:  the old package version
post_remove() {
  getent passwd sonar > /dev/null && usr/sbin/userdel sonar &>/dev/null
  getent group sonar > /dev/null && usr/sbin/groupdel sonar &>/dev/null  

	if [ -x /opt/sonarqube/run ] ; then
	    rm -r /opt/sonarqube/run
	fi  
}

