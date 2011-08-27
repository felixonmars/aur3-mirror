#!/bin/bash
#
# delutmpentry
#
# Remove an entry from the utmp file
# when "w" and "who" show a user logged in that really isn't
# 
# Depends: /usr/bin/utmpdump, /bin/dd, /usr/bin/expr,
#          /usr/bin/vi, /bin/cat, /bin/mv, /bin/chmod, /bin/chown
#
# utmp and wtmp are 384 byte fixed length records
# utmpdump exists on some systems and can be compiled
# on others. Once it is there, you can use it to dump out the
# content of utmp/wtmp sequentially - then, once you find
# the line number in the utmpdump output file, you have
# the record number to skip over when re-creating the
# file - which you can do with dd !!!
#

OS=`uname -s | cut -c1-3`
case ${OS} in
"Lin")  ECHO="echo -e"
        ;;
"SCO")  ECHO="echo"
        ;;
esac

# Set std location of utmp file
UTMP=/var/run/utmp

/usr/bin/utmpdump $UTMP > /tmp/utmp0.$$
$ECHO "Find out what line number (ctrl+g) the entry is on and then quit vi."
$ECHO "Press enter to start vi: \c"
read ans gbg
vi /tmp/utmp0.$$
$ECHO "Enter the line number to remove: \c"
read ans gbg
SkipLines=`expr $ans + 0`
[ $SkipLines -le 0 ] && {
  $ECHO "Exiting without taking any actions."
  exit 0
}
BegLines=`expr $ans - 1`
[ $BegLines -gt 0 ] && dd if=$UTMP of=/tmp/utmp1.$$ bs=384 count=$BegLines
dd if=$UTMP of=/tmp/utmp2.$$ bs=384 skip=$SkipLines
cat /tmp/utmp1.$$ /tmp/utmp2.$$ > /tmp/utmp3.$$
mv $UTMP $UTMP.save$$
mv /tmp/utmp3.$$ $UTMP
chmod 664 $UTMP
chown root:root $UTMP