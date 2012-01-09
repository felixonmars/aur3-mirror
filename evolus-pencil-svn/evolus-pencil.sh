#!/bin/sh
cd `dirname $0`
DIR=`pwd`
APP_INI=$DIR/app/application.ini

xulrunner --app "$APP_INI"
