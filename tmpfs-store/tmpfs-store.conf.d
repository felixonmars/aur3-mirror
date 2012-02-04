#
# Configuration for tmpfs-store
#

# List of tmpfs file systems to store
TFSST_FSES="/var/log /var/run"

# Where to store the tmpfs archives
TFSST_ARC_DIR="/.tmpfs-store"

# Destination directory for archive extraction. Normally "/", use for
# debugging of extraction
TFSST_ARC_EXTRACT_DST="/"
