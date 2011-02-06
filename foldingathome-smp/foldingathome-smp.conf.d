#
# Optional user settings for foldingathome-smp daemon
#
# If you prefer not to run fah as root then you can identifer a current or
# specially created user here.

FAH_USER=""

# If you wish to associate this user with a specific group you can enter the
# group name here.  If left blank the default is "users".

FAH_GRP=""

# Place any additional Folding@Home client flags here

FAH_CLIENT_FLAGS="-smp -verbosity 9 -forceasm"

