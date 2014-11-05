/var/log/turnserver/*log {
    notifempty
    copytruncate
    missingok
    postrotate
        /bin/kill -HUP `cat /var/run/turnserver/turnserver.pid 2>/dev/null` 2> /dev/null || true
    endscript
}