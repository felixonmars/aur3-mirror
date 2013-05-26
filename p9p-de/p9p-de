#!/bin/sh
# This script starts an as complete as possible plan9port session
# special options can be added by editing this file or the  $HOME/.riostart file.

#if [-z $HOME/.riostart]
#then
#  cp /etc/skel/riostart.rc $HOME/.riostart  
#fi

PATH=/opt/plan9/bin:$PATH
SHELL=/opt/plan9/bin/rc
EDITOR=/opt/plan9/bin/acme
#TODO:
#check for abaco and set BROWSER to abaco if present
#figure out how to start plan9port with factotum and all other bells-and-whistles

exec /opt/plan9/bin/9 rio
#-i $HOME/.riostart 