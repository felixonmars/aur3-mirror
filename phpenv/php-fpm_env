#!/bin/bash

export $(grep -o -P 'PHPENV_USER=(.*)' /etc/environment)
ENV_DIR="/home/${PHPENV_USER}/.phpenv"

if [ -a $ENV_DIR/shims/php-fpm ]; then
	$ENV_DIR/shims/php-fpm $@
else
	/usr/bin/php-fpm $@
fi
