#!/bin/sh
devdocsdir=/usr/share/webapps/devdocs

if [ -d "$devdocsdir" ]; then
    cd "$devdocsdir"
    sudo -g devdocs -u devdocs /usr/bin/bundle exec thor docs:$@
else
    exit 1
fi
