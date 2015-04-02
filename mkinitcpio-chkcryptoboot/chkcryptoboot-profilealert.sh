#!/usr/bin/env bash

# chkcryptoboot-profilealert.sh: copy to /etc/profile.d/chkcryptoboot-profilealert.sh and change its permissions to executable
#
# author: Giancarlo Razzolini <grazzolini@gmail.com>
# heavily based on chkboot: https://github.com/inhies/chkboot

source /etc/default/chkcryptoboot.conf

if [ -n "$CMDLINE_NAME" -a -n "$CMDLINE_VALUE" ]; then
    #checks if the name value pair was configured and checks for them in the kernel's cmdline
    for param in `cat /proc/cmdline` ; do
	if [ $param = $CMDLINE_NAME=$CMDLINE_VALUE ]; then
	    return 0
	fi
    done
fi

#will never hit if the check above succeeded.
echo -e "CHKCRYPTOBOOT ALERT!\n"
echo -e "You boot partition was probably bypassed!\n"
echo "Please check your kernel cmdline and your chckcryptobook configuration!"
return 1
