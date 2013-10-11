#!/bin/sh

post_install() {
    echo 'Updating desktop database...'
    update-desktop-database -q

    echo 'Updating icon database...'
    xdg-icon-resource forceupdate
}

post_upgrade() {
    post_install
}

post_remove() {
    post_install
}
