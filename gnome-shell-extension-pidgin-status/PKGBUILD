# Maintainer: keshto[at]gmail

pkgname=gnome-shell-extension-pidgin-status
pkgver=3.4
pkgrel=1
pkgdesc="Extension to move the Pidgin icon from the notification area (bottom bar) to the status area (top bar)."
url="http://mo.morsi.org/blog/node/337"
depends=('pidgin' 'dbus-core' 'libpurple' 'gnome-shell')
source=('extension.js' 'metadata.json')
license=('GPL')
arch=('any')
build() {
	cd "$srcdir"
	mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/pidgin.status@gnome-shell.morsi.org"
	cp extension.js $pkgdir/usr/share/gnome-shell/extensions/pidgin.status@gnome-shell.morsi.org
	cp metadata.json $pkgdir/usr/share/gnome-shell/extensions/pidgin.status@gnome-shell.morsi.org
}

md5sums=('0851462b82bc5d95824f0f8b760b8320'
         '3a00d7683c8babd2934dfb6f90901ed7')
