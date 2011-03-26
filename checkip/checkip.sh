#!/bin/bash
. /etc/checkip.conf

sendmail() {
# add proxy line below
sendEmail -f ${from} -t ${email} -s ${smtp} -u "IP Changed" -m "New ip is ${currentip}"
}

checkip() {
if [ ! -f ~/.oldip ]; then
 echo No old IP on record so getting it now and writting to database.
 echo `curl ${proxy} -s http://www.whatsmyip.us/ | grep "</textarea>"| sed 's/[</].*$//'` > ~/.oldip
 oldip=`cat ~/.oldip`
else
 oldip=`cat ~/.oldip`
fi
}

updateold() {
echo Current IP different from old IP so updating record in database.
echo ${currentip} > ~/.oldip
}

writelog() {
if [ ! -f ${log} ]; then
 echo -e "Date/Time \t\t Action" > ${log}
fi
echo -e "${now} \t ${check}" >> ${log}
}

clear
now=`date "+%m-%d-%Y %H:%M:%S"`

echo Checking IP against database.
checkip
currentip=`curl ${proxy} -s http://www.whatsmyip.us/ | grep "</textarea>"| sed 's/[</].*$//'`

if [ -z ${currentip} ]; then
 # net up or down
 check="WAN or website down, no action taken."
 echo Null value detected so your internet is likely down.
 writelog
 exit 1
fi 

if [ ${currentip} != ${oldip} ]; then
 # IP changed
 check="IP changed, sending mail and updateding db."
 echo Current IP differs from IP in database so notifying and updating database.
 sendmail
 updateold
 writelog
else
 # no change
 check="No change to IP detected, no action taken."
 echo IP matches IP on record so taking no action.
 writelog
fi
