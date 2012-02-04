/var/log/labrea.log {
  compress
  delaycompress
  weekly
  size 32M
  rotate 4

  postrotate
	/bin/kill -HUP `cat /var/run/labrea.pid 2>/dev/null` 2> /dev/null || true
  endscript
}
