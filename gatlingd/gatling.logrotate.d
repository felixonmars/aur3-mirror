/var/log/gatling/*log {
    postrotate
        /bin/kill -HUP `cat /var/run/gatling/gatling.pid 2>/dev/null` 2> /dev/null || true
    endscript
}
