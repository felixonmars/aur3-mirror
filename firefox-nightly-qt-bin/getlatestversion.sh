#!/bin/bash
curl --silent "http://ftp.mozilla.org/pub/mozilla.org/firefox/tinderbox-builds/mozilla-central-linuxqt/" | tail -n8 | head -1 | sed 's/[^0-9]//g' | cut -c -10
