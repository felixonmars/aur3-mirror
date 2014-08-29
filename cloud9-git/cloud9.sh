#!/bin/sh
node /var/lib/cloud9/server.js $@ &
chromium --app=http://127.0.0.1:3131 
