#
# Configuration for tmpfs-varlog
#

# Where to store the archive of /var/log
TFSVL_ARC_DIR="/.var.log"

# Filename of /var/log archive
TFSVL_ARC_FN="var.log.tar.gz"

# Destination directory for archive extraction. Normally "/", use for
# debugging of extraction
TFSVL_ARC_EXTRACT_DST="/"
