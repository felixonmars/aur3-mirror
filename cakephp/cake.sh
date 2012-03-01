#!/bin/bash
clear

LIB="/srv/http/cakephp/cake/console/"
APP=`pwd`

exec php -q ${LIB}cake.php -working "${APP}" "$@"

exit
