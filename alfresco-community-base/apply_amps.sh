#!/bin/sh
# -------
# Script for apply AMPs to installed WAR
# -------
export ALF_HOME=/usr/share/webapps/alfresco
mmtjar=/usr/share/java/alfresco/alfresco-mmt.jar
echo "This script will apply all the AMPs in amps and amps-share to the alfresco.war and share.war files in $ALF_HOME"
echo "Press control-c to stop this script . . ."
echo "Press any other key to continue . . ."
read RESP
java -jar $mmtjar install $ALF_HOME/amps $ALF_HOME/alfresco.war -directory
java -jar $mmtjar list $ALF_HOME/alfresco.war
java -jar $mmtjar install $ALF_HOME/amps_share $ALF_HOME/share.war -directory
java -jar $mmtjar list $ALF_HOME/share.war
