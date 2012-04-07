# Maintainer: Federico Giuliani <federico.giuliani86 at gmail dot com>
# Dropbox version of gnome-shell-extension-pidgin-status
# Thanks to kdas for PKGBUILD idea and Mo Morsi for extension idea

pkgname=gnome-shell-extension-dropbox-status
pkgver=3.4
pkgrel=1
pkgdesc="A gnome shell extension that places the tray icon from Dropbox on the top bar rather than the hidden bottom bar"
url="http://mo.morsi.org/blog/node/337"
depends=('gnome-shell')
source=('extension.js' 'metadata.json')
license=('GPL')
arch=('any')
build() {
	cd "$srcdir"
	mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/dropbox.status@gnome-shell.morsi.org"
	cp extension.js $pkgdir/usr/share/gnome-shell/extensions/dropbox.status@gnome-shell.morsi.org
	cp metadata.json $pkgdir/usr/share/gnome-shell/extensions/dropbox.status@gnome-shell.morsi.org
}
md5sums=('96bfdaa365b93724df466ead1c1628a9'
         '424c0a47cdf15850315632523f457556')
