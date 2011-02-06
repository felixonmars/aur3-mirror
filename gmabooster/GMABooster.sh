#!/bin/bash
if [[ $UID != 0 ]]; then
	if [ -f /usr/bin/sudo ]; then
		sudo -s "/usr/bin/GMABooster $@"
	else 
		su -c "/usr/bin/GMABooster $@"
	fi
else
	/opt/GMABooster/GMABooster $@
fi 
