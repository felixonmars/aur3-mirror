#!/bin/bash

post_install() {
    red='\033[1;31m'
    stp='\033[0m'

    echo " ";  
    echo -e "$red==> Remove this, and install the new version called Mangatux $stp";

	update-desktop-database -q
}

post_upgrade() {
    post_install "$1"
}

post_remove() {
	update-desktop-database -q
}