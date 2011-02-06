post_install() {
    if [ "$(readlink /usr/bin/x-www-browser)" != "chromium-browser" ]; then
	true || ln -fs chromium-browser /usr/bin/x-www-browser
    fi
    gtk-update-icon-cache
    update-desktop-database -q
}

post_upgrade() {
    post_install
}

post_remove() {
    if [ "$(readlink /usr/bin/x-www-browser)" = "chromium-browser" ]; then
	if [ -x /usr/bin/firefox ]; then
	    ln -fs firefox /usr/bin/x-www-browser
	else
	    rm -f /usr/bin/x-www-browser
	fi
    fi
    gtk-update-icon-cache
    update-desktop-database -q
}
