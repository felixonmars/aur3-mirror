#!/bin/sh
# $Id$
# vim:set ts=2 sw=2 et:

# arg 1:  the new package version
pre_install() {
 /bin/true
}

# arg 1:  the new package version
post_install() {
  # link to the system rails installation
  ln -s /usr/share/rails /opt/redmine/vendor/	
	
  echo ">>> Creating redmine user and group and setting permissions..."
  getent group redmine >/dev/null || usr/sbin/groupadd redmine
  getent passwd redmine >/dev/null || usr/sbin/useradd -c 'Redmine PMS'\
		-g redmine -d '/opt/redmine' --system -s /bin/bash redmine
  
  cd opt/redmine

  mkdir tmp 
  mkdir public/plugin_assets
  echo ">> Change Ownership for corresponding directories"
  chown -R redmine:redmine config files log tmp public/plugin_assets
  chmod -R 755 config files log tmp public/plugin_assets
  
  echo ">>> Creating log-storage"
  mkdir /var/log/redmine
  chown -R redmine:root /var/log/redmine
  chmod -R 775 /var/log/redmine

  echo ">>> Generating session store secret..."
  rake config/initializers/session_store.rb

  cat << EOF
>>>
>>> You can run Redmine in a couple of different ways:
>>> * Apache (via passenger)
>>> * WEBrick (standalone included webserver) - script/ruby -e production
>>> 
>>> When running via WEBrick, you can start the daemon via:
>>>   /etc/rc.d/redmine start
>>> Alternatively add "redmine" to the DAEMONS array in /etc/rc.conf.
>>>
>>> To run it i Apache, add the following into the section
>>> "Supplemental configuration" of /etc/httpd/conf/httpd.conf.
# Redmine PMS
Include conf/extra/httpd-redmine.conf
>>>
>>> After the installation you should create the database (in MySQL)
>>> with the following commands:
>>> mysql -u root -p
>>> mysql> create database redmine character set utf8;
>>> mysql> create user 'redmine'@'localhost' identified by 'redmine'
>>> mysql> grant all privileges on redmine.* to 'redmine'@'localhost' 
>>> rake db:migrate RAILS_ENV="production"
>>>
>>> Furthermore you could add some default data with:
>>> rake redmine:load_default_data RAILS_ENV="production"
>>>
>>> Default login and password are admin/admin. Remember to change these.
>>>
>>> Further installation help can be found at: 
>>> http://www.redmine.org/wiki/redmine/RedmineInstall
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
  cd opt/redmine
  echo ">> Change Ownership for corresponding directories"
  chmod -R 755 config files log tmp public/plugin_assets

  echo ">>> Clearing cache and existing sessions..."
  rake tmp:cache:clear
  rake tmp:sessions:clear
  echo ">>> Remember to update you database with"
  echo ">>>   rake db:migrate RAILS_ENV=\"production\" >/dev/null"
}

# arg 1:  the old package version
pre_remove() {
  usr/sbin/userdel redmine &>/dev/null
  usr/sbin/groupdel redmine &>/dev/null
}

# arg 1:  the old package version
post_remove() {
 /bin/true
}
