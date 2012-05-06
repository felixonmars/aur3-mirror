/var/log/thttpd/*log {
	missingok
	postrotate
	/etc/rc.d/thttpd restart >/dev/null || true
	endscript
}
