#!/bin/sh
/usr/share/awstats/tools/awstats_updateall.pl now \
	-configdir=/etc/awstats \
	-awstatsprog=/srv/http/awstats/cgi-bin/awstats.pl > /dev/null

chmod -R og+r /var/lib/awstats
