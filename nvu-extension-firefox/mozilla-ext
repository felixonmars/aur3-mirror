#!/bin/sh

export MOZILLA_FIVE_HOME=/opt/mozilla/lib/firefox
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$MOZILLA_FIVE_HOME

# get URL to load
url=$1; [ -z $url ] && url=about:blank

# try xremote first
$MOZILLA_FIVE_HOME/mozilla-xremote-client openURL\($url\) && exit 0

# if xremote failed, then launch the browser
exec /opt/mozilla/bin/firefox $url
