#!/bin/bash
#
# SOVA miscellaneous2 settings.
#
# WARNING! Remember to put '$true' in any function you intend to leave empty
#          (e.g. you don't need to use  the 'custom_variables' function)
#          to make sure the script doesn't break.

binaries_paths()
{
### get full paths
# the 'exit 0' binary
true="`which true`"

modprobe="`which modprobe`"
}

custom_variables()
{
# define whatever you need here

mods_to_remove=(pcspkr uhci_hcd)
}

start_misc()
{
    for ctr1 in ${mods_to_remove[*]}
    do
	$modprobe -r $ctr1
    done
}

stop_misc()
{
    $true
}

# EOF

