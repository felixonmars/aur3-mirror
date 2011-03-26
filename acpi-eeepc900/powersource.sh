#!/bin/bash
#hotkey ATKD 00000051 00000007
source /etc/acpi/eee.conf

case $3 in
	00000051) #AC unplugged
		$AC_UNPLUGGED_COMMAND &	
	;;
	00000050) #On AC
		$AC_PLUGGED_COMMAND &
	;;
esac

exit 0
