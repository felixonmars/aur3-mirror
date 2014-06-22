# Default settings for fanout server

# Options to pass to fanout
# Default port is 1986, change with --port= option
FANOUT_OPTS="--daemon --pidfile=/run/fanout/fanout.pid --run-as=fanout:fanout --logfile=/var/log/fanout/fanout.log --debug-level=2"
