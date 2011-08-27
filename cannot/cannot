#!/bin/bash

args=(${@})
command=${args[0]}
packages=${args[@]:1}

case $command in
	install)
		cant install --print "${packages[@]}" | grep '^[^: ]' | aria2c --summary-interval=0 -d /var/cache/pacman/pkg -i-
		cant "$@"
	;;
	love)
		echo 'Make war?'
	;;
	*)
		cant "$@"
	;;
esac
