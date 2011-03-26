#!/bin/bash
#Made by Marcelo A.

# Set to "C" locale so we can parse messages from commands
LANG=C
export LANG

CONFIG=/etc/ppp/pptp.conf
USER=""
ETH=""
ME=`basename $0`
# Protect created files
umask 077
copy() {
    cp $1 $2
    if [ "$?" != 0 ] ; then
       echo "*** Error copying $1 to $2"
       echo "*** Quitting."
       exit 1
    fi
}

# Must be root
if [ "`id -u`" != 0 ] ; then
    echo "$ME: You must be root to run this script" >& 2
    exit 1
fi

# Prototype config file must exist
if [ ! -r "$CONFIG" ] ; then
    echo "Oh, dear, I don't see the file '$CONFIG' anywhere.  Please"
    echo "re-install the client."
    exit 1
fi

. $CONFIG

echo "Welcome to the cable connection setup."
echo "Please enter some information:"

while [ true ] ; do
    echo ""
    echo "USER NAME"
    echo ""
    echo -n ">>> Enter your user name (default $USER): "
    read U

    if [ "$U" = "" ] ; then
        U="$USER"
    fi

    # Under Linux, "fix" the default interface if eth1 is not available
    if test `uname -s` = "Linux" ; then
        ifconfig $ETH > /dev/null 2>&1 || ETH=eth0
    fi
    echo ""
    echo "INTERFACE"
    echo ""
    echo ">>> Enter the Ethernet interface connected to the Cable modem"
    echo "For Linux, it will be ethn, where 'n' is a number."
    echo -n "(default $ETH): "
    read E

if [ "$E" = "" ] ; then
        E="$ETH"
    fi

    echo ""
    echo "SERVER ADDRESS"
    echo ""
    echo ">>> Enter the Server address of your ISP."
    echo -n "(default $SERVERADDR): "
    read S
   if [ "$S" = "" ] ; then
         S="$SERVERADDR"
   fi

    echo ""
    echo "DNS"
    echo ""
    echo "Please enter the IP address of the primary DNS server."
    echo "If you want the server to automatically provide you the addresses',"
    echo "enter 'server' (all lower-case) here."
    echo "If you just press enter, I will assume you know what you are"
    echo "doing and not modify your DNS setup."
    echo -n ">>> Enter the DNS information here: "

    read DNS1


    if [ "$DNS1" != "" ] ; then
        if [ "$DNS1" != "server" ] ; then
            echo "Please enter the IP address of your ISP's secondary DNS server."
            echo "If you just press enter, I will assume there is only one DNS server."
            echo -n ">>> Enter the secondary DNS server address here: "
             read DNS2
        fi
    fi


    while [ true ] ; do
        echo ""
        echo "PASSWORD"
        echo ""
        stty -echo
        echo -n ">>> Please enter your password:    "
        read PWD1
        echo ""
        echo -n ">>> Please re-enter your password: "
        read PWD2
        echo ""
        stty echo
        if [ "$PWD1" = "$PWD2" ] ; then
            break
        fi

        echo -n ">>> Sorry, the passwords do not match.  Try again? (y/n)"
        read ANS
        case "$ANS" in
            N|No|NO|Non|n|no|non)
                echo "OK, quitting.  Bye."
                exit 1
        esac
    done

   echo ""
   echo "** Summary of what you entered **"
   echo ""
   echo "Ethernet Interface: $E"
   echo "User name:          $U"

    if [ "$DNS1" != "" ] ; then
        if [ "$DNS1" = "server" ] ; then
            echo "DNS addresses:      Supplied by ISP's server"
        else
            echo "Primary DNS:        $DNS1"
            if [ "$DNS2" != "" ] ; then
                echo "Secondary DNS:      $DNS2"
	    fi
         fi
     else
         echo "DNS:                Do not adjust"
     fi
         echo ""
	 while [ true ] ; do
	 echo -n '>>> Accept these settings and adjust configuration files (y/n)? '
	 read ANS
	 case "ANS" in
	     Y|y|yes|Yes|oui|Oui)
	         ANS=y
	         ;;
	     N|n|no|No|non|Non)
	         ANS=n
	         ;;
	 esac
	 if [ "$ANS" = "y" -o "$ANS" = "n" ] ; then
	     break
	 fi
     done
     if [ "$ANS" = "y" ] ; then
         break
     fi
 done

# Adjust configuration files.  First to $CONFIG
copy $CONFIG $CONFIG-bak
if [ "$DNS1" = "server" ] ; then
    DNSTYPE=SERVER
    DNS1=""
    DNS2=""
    PEERDNS=yes
else
    PEERDNS=no
    if [ "$DNS1" = "" ] ; then
        DNSTYPE=NOCHANGE
    else
        DNSTYPE=SPECIFY
    fi
fi
# Where is pppd likely to put its pid?
if [ -d /var/run ] ; then
    VARRUN=/var/run
else
    VARRUN=/etc/ppp
fi


sed -e "s&^USER=.*&USER='$U'&" \
    -e "s&^ETH=.*&ETH='$E'&" \
    -e "s&^SERVERADDR=.*&SERVERADDR='$S'&" \
    -e "s/^DNSTYPE=.*/DNSTYPE=$DNSTYPE/" \
    -e "s/^DNS1=.*/DNS1=$DNS1/" \
    -e "s/^DNS2=.*/DNS2=$DNS2/" \
    -e "s/^PEERDNS=.*/PEERDNS=$PEERDNS/" \
    < $CONFIG-bak > $CONFIG

if [ $? != 0 ] ; then
    echo "** Error modifying $CONFIG"
    echo "** Quitting"
    exit 1
fi

echo "Adjusting /etc/ppp/pap-secrets and /etc/ppp/chap-secrets"
if [ -r /etc/ppp/pap-secrets ] ; then
    echo "  (But first backing it up to /etc/ppp/pap-secrets-bak)"
    copy /etc/ppp/pap-secrets /etc/ppp/pap-secrets-bak
else
    cp /dev/null /etc/ppp/pap-secrets-bak
fi
if [ -r /etc/ppp/chap-secrets ] ; then
    echo "  (But first backing it up to /etc/ppp/chap-secrets-bak)"
    copy /etc/ppp/chap-secrets /etc/ppp/chap-secrets-bak
else
    cp /dev/null /etc/ppp/chap-secrets-bak
fi

egrep -v "^$U|^\"$U\"" /etc/ppp/pap-secrets-bak > /etc/ppp/pap-secrets
echo "\"$U\"   *       \"$PWD1\"       *" >> /etc/ppp/pap-secrets
egrep -v "^$U|^\"$U\"" /etc/ppp/chap-secrets-bak > /etc/ppp/chap-secrets
echo "\"$U\"   *       \"$PWD1\"       *" >> /etc/ppp/chap-secrets

echo ""
echo ""
echo ""
echo "Congratulations, it should be all set up!"
echo ""
echo "Type: '/etc/rc.d/cable start'  - to bring up your CABLE link"
echo "      '/etc/rc.d/cable stop'   - to bring it down"
echo "      '/etc/rc.d/cable status' - to see the link status."
exit 0
