#!/bin/sh
COLLECT_SCRIPT=/usr/bin/perlbin/vendor/collect-reminders
SEND_SCRIPT=/usr/bin/perlbin/vendor/send-reminders

if [ -x "$COLLECT_SCRIPT" -a -x "$SEND_SCRIPT" ]; then
     $COLLECT_SCRIPT
     su - email-reminder -c $SEND_SCRIPT
fi
