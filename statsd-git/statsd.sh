CONFIG=
cd /opt/statsd
source /etc/conf.d/statsd
node /opt/statsd/stats.js $CONFIG &
