# /etc/conf.d/novacomd

# Usage:  novacomd [option]...
# options:
# -b                  bind ipaddress for remote access, default is 127.0.0.1 
# -t <seconds>        set recovery timeout interval, valid range 2 ~ 5, default is 5
# -c <host>:<port>    connect to specified IP address
# -e <io-retry-timeout>    timeout to retry packet I/O in milliesecond
# -s <io-retry-delay>    delay to retry packet I/O in milliesecond
# -d                  run in the background
# -V                  print version info
# -h                  display this help

NOVACOMD_OPTIONS=""
