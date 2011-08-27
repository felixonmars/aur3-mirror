#!/bin/bash
buildversion=`./getlatestversion.sh`
curl --silent "http://ftp.mozilla.org/pub/mozilla.org/firefox/tinderbox-builds/mozilla-central-linuxqt/$buildversion/" | grep "tar.bz2" | sed 's/firefox-/&\n/;s/.*\n//;s/en-US/\n&/;s/\n.*//'
