#!/bin/sh
node /var/lib/cloud9/server.js -w $HOME & 
chromium --app=http://127.0.0.1:3131 
