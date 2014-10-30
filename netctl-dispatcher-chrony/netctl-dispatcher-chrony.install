#!/bin/bash

post_install() {
	echo " # Append the following lines to your netctl profile: \n"
	echo " ExecUpPost='/usr/share/netctl-dispatcher-chrony/chrony-up.sh'"
	echo " ExecDownPre='/usr/share/netctl-dispatcher-chrony/chrony-down.sh'"
}

post_remove() {
	echo " # Don't forget to remove the ExecUpPost and ExecDownPre lines, where needed"
	echo " # Not doing so can cause your profile not to load"
}
