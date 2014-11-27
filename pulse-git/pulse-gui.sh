#!/usr/bin/bash
if [ -f /usr/bin/xmllint ]; then
    HOST=http://$(xmllint ~/.config/pulse/config.xml --xpath "configuration/gui/address/text()")
else
    HOST="http://localhost:8080"
fi

/usr/bin/xdg-open "${HOST}"
