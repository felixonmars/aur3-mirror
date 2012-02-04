#!/usr/bin/env bash

cd src/factor
. build-support/factor.sh > /dev/null

case "$1" in
fetch)
    get_config_info && update_boot_images
    ;;
*)
    update && update_boot_images
    ;;
esac
