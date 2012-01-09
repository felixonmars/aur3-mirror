#!/bin/sh
cd /usr/lib/evolus-pencil-svn/
DIR=`pwd`
APP_INI=$DIR/app/application.ini

xulrunner --app "$APP_INI"
