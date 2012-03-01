#!/bin/bash
clear

LIB="/srv/http/cakephp2/lib/Cake/Console/"
APP=`pwd`

exec php -q ${LIB}cake.php -working "${APP}" "$@"

exit
