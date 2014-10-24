#!/bin/sh
rm -rf /tmp/.cache/chromium
rm -rf ~/.cache/chromium
rm -rf /tmp/*chromium*
rm -rf /tmp/.chromium
mkdir -p /tmp/.cache/chromium
ln -s /tmp/.cache/chromium ~/.cache/chromium
chromium --incognito --enable-pinch --save-page-as-mhtml --enable-google-now --user-data-dir=/tmp/chromium "$*"