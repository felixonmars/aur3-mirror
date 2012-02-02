# See man sheep(8) for more information.

# The user to run as.
# If you change this, also change:
# - the permissions of $PATH
# - /etc/corosync/uidgid.d/sheepdog
SHEEPDOG_USER="sheepdog"

# Arguments passed to the sheepdog daemon.
SHEEPDOG_ARGS="-p 7000"

# Path to the storage directory.
# The directory must be on a filesystem with xattr support.
SHEEPDOG_PATH="/var/lib/sheepdog"
