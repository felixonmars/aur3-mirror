#!/bin/sh
post_install() {
	gtk-update-icon-cache -ftq /usr/share/icons/hicolor
	update-desktop-database -q
	glib-compile-schemas /usr/share/glib-2.0/schemas
}

post_remove() {
	gtk-update-icon-cache -ftq /usr/share/icons/hicolor
	update-desktop-database -q
	glib-compile-schemas /usr/share/glib-2.0/schemas
}

post_upgrade() {
	gtk-update-icon-cache -ftq /usr/share/icons/hicolor
	update-desktop-database -q
	glib-compile-schemas /usr/share/glib-2.0/schemas
}
