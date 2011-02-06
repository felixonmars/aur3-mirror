IPTABLES="/usr/sbin/iptables"
TRANSOCKS_PORT="1211" # Port that transocks listens on. Shouldn't need to change.
SOCKS_HOST="127.0.0.1" # Server and port for socks server
SOCKS_PORT="1080"
LOCAL_IPS="10.0.0.0/8 192.168.0.0/16" # Space separated list of IP/NETMASK
ENABLE_ROUTING="" # Set to "y" to enable. Enables socks routing for other hosts.
ENABLE_LOGGING="" # Logs connections to /var/log/iptables.log
