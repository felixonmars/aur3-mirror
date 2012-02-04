#!/bin/sh

#Uncomment the line below to begin (mandatory)
#CHECK=YES

#Below the user to run the service as (mandatory)
RUNASUSER="root"

#Below the password on the XBOX (optional)
#REMOTEPASS="xboxpassword" 

#Below the interface to listen on (mandatory)
LISTENINTERFACE="192.168.2.1"

FOLLOWSYMLINKS=YES

#Comment (optional)
SERVERCOMMENT="ccXstream server. Powered by ArchLinux!"

#Shares to make available (mandatory)
SHARES="share1=/path/to/share1 share2=/path/to/share2"

#Location of binary file. Leave default unless you know what you're doing (mandatory)
BIN="/usr/bin/ccxstream"

#-----------------------------------------------------------------------------#
#-----------------------------------------------------------------------------#

DIR="-"

PIDFILE=/var/run/ccxstream.pid

PARAMS="-f -F $PIDFILE -r $DIR -u $RUNASUSER"

if test "$FOLLOWSYMLINKS" == "YES" ; then
    PARAMS="$PARAMS -L"
fi

if test "x$REMOTEPASS" != "x" ; then
    PARAMS="$PARAMS -P $REMOTEPASS"
fi

if test "x$LISTENINTERFACE" != "x" ; then
    PARAMS="$PARAMS -l $LISTENINTERFACE"
fi

for i in $SHARES ; do
    PARAMS="$PARAMS -S $i"
done

if test "x$SERVERCOMMENT" = "x" ; then
    SERVERCOMMENT="`hostname`"
fi
			    
