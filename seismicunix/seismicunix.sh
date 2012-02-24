# Make sure CWPROOT is set
[ -z "$CWPROOT" ] && CWPROOT="/opt/seismicunix"
PATH="$PATH:$CWPROOT/bin"
export CWPROOT
export PATH
