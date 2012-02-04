#!/bin/sh

WEBAPP_DIR=/srv/tomcat/webapps

# 
# Bring down tomcat and remove the temporary directories
#
/etc/rc.d/tomcat stop 
sleep 5
rm -rf $WEBAPP_DIR/alfresco
rm -rf $WEBAPP_DIR/share

#
# Refresh the AMPS
#
apply_amps.sh

#
# Bring Tomcat back up
#
/etc/rc.d/tomcat start
