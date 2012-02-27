#
# Settings for hdapsd
# 
# DEVICE specifies the device to monitor, defaults to 'sda'
#
# SENSITIVITY is self explanatory, defaults to '15'
#
# Set ADAPTIVE to 'yes' to enable adaptive threshold
# (automatic increase when the built-in keyboard/mouse are used).
#
# Set SYSLOG to 'yes' to have the daemon report errors to syslog
# (instead of stderr/stdout).
#
# Set FORCE to 'yes' to force the kernel to use the unload heads feature
# on some old hard drives for which support cannot be autodetected.
# (don't use this unless you're absolutely sure your hard drive
# really do support unloading heads)
#
#DEVICE='sda'
# If an ultrabay hard drive is inserted, the following can be used:
#DEVICE=('sda' 'sdb')
#SENSITIVITY='15'
#ADAPTIVE='yes'
SYSLOG='yes'
#FORCE='yes'
