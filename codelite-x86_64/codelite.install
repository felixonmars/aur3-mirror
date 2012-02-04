#!/bin/bash

available() {
    which "$1" >/dev/null 2>&1
}

post_install() {
    update-mime-database /usr/share/mime >/dev/null
    update-desktop-database -q /usr/share/applications

    if available xdg-icon-resource; then
        xdg-icon-resource forceupdate --theme hicolor &> /dev/null
    fi

    if available gtk-update-icon-cache; then
        gtk-update-icon-cache -q /usr/share/icons/hicolor
    fi
}

post_remove() {
	post_install
}
